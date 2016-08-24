class MyWorkflow
  def step1
    # Rubyから子タスクを実行
    Digdag.env.add_subtask(MyWorkflow, :step1_1, arg1: 2)
    sleep(1)
  end

  def step1_1
    sleep(3)
  end

  def step2()
    # raise "何らかのエラー"

    # RubyからDigdagの変数を設定
    Digdag.env.store(foo: 'hello')
    Digdag.env.store(bar: %w[quick brown fox over the lazy dogs])
  end

  def step4(bar:)
    # step3で設定した変数を読み込んで表示
    bar.each do |word|
      puts word
    end
  end
end
