Wtf::Wtf.configure do
  scm :git # Extend for Hg, Subversion, etc..

  tracker :pivotaltracker, :project_id => 123456 
  # we should use: https://github.com/hybridgroup/ticketmaster

  development_branch :development
  production_branch  :production

  repository do
    url 'git@github.com:Foo/bar.git'
    auth '??'
    commit_template  '' # Write a default to get this started right.
    hooks :pre => '', :post => '', :clone => '' # Something here for CI, immediately.  Always set authors.
  end

  continous_integration :hudson # :bigtuna ?

  topics do

    feature :source => :development_branch do |feature_name|
      tag   feature_name
      merge :development_branch
    end

    # rebase implies merge? 
    hotfix :source => :production_branch do |hotfix_name|
      tag hotfix_name
      rebase :production_branch
      merge :development_branch, :rebase => false, :ff => false
      merge :current_release_branch, :rebase => ??, :ff => false
    end

    # Work on release branch preparation must be merged back to development, as well as going forward to the production branch itself.
    release :source => :development_branch do |release|
      tag release
      rebase :production_branch
      rebase :development_branch
    end

    bug :source => :development_branch do |bug_name|
      tag bug_name
      merge :development_branch
    end

    chore :source => :development_branch do |chore_name|
      tag chore_name
      merge :development_branch
    end
  end


  # Actions which apply to each topic?  
  actions do

    start :ticket do |ticket|
    end

    # but demonstration only applies to features probably ..?
    demonstrate :ticket do |topic|
    end

    finish :ticket do |topic|
      # this should do 'test' and 'demonstrate'
    end

    test :ticket do
      # local tests only?
      # spork or test server?
      # 
    end

    deliver :ticket do
    end

  end

  roles do
    developer
    release_master
    designer
  end

end

