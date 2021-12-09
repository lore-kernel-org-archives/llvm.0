Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76F68
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 01:51:55 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z5so14663844edd.3
        for <llvm@lists.linux.dev>; Wed, 08 Dec 2021 17:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GG+lCnH988fX6GF0zU5+9f7rEQLZwfZ0q1MvlvDrpf0=;
        b=l+tegFkIRPiaAG3dCwWHp5xCcE1fZ1VEwtnp0egEzfLwtfeK+86aXagidNVBvLuNAj
         vkyGePpzMqZkA9ctJk8GOl1W7NTdh1om7r5Wdl5EM9Qz5lyEvRxT6sCGM/NVQUWSJcz7
         dwll/B/AGp2MhRzZwOBYbGtkR+KNia1wen54fbLViA0q06vJMDbDBLRFYcelPhZkoZa/
         lwYQg1xNkViCVmvx/gMFS7qxdQyX585wO/5BJWDzs2drBnz5BXaN6Vu2qQ3Hf7FVku+h
         TYuBOzWVvdmNZTqRaaXZqLA2dFLoOQPKYBENFrrOwMRgI3gUibgJA+V1smAu3rqpwnzx
         zZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GG+lCnH988fX6GF0zU5+9f7rEQLZwfZ0q1MvlvDrpf0=;
        b=LO16L6nyvwFmw2/Hqf4VojuaK9BWOsu+LR3MoAA4726g84STo2Cyd4mmdc47Z0wNKn
         LqIALZfhBMMbS6FU4uIw+wsEgl3+mRtcGJ7Lid44PvzpBEkazYuKv1w4q/cu45M1K+9d
         cm+8gLGdJOlxx6YJZG+jz35vPdbe0wdKTjjK3fmDQU6LRqBqBjZTu1vD+fNk75RDHn4x
         PrIEWRbM1UUW79kJnJh5g1FokEGTyjUP9GnxyOz7bZpDlyEIWq0U3Qj9PyvPlsVqpuRs
         hmzfiLph6aBX7RFMldXQgAfooJvhW2kuuE0uyueleHx92E6K/tWY+WOHt9HYh8zS4XLI
         7b5w==
X-Gm-Message-State: AOAM532mVrpYxCmDhx/2Y73uEFFeRnsqdjqNtx2CpDFOg+H5ClsOWSli
	9a5IW5u/kjFgUkjc2t4BLHoFFy2CsZZ2Fm7Xo7RGVkSYKTU=
X-Google-Smtp-Source: ABdhPJxREIILLe7LuCNiTKzf6pmpaenmmqtxvpRwdD7+UKrKNIiKgp7qHWkdPNTAO9AFCY8MPGo9x5jlRR/cLSKXbAU=
X-Received: by 2002:a17:906:9144:: with SMTP id y4mr11320778ejw.98.1639014713835;
 Wed, 08 Dec 2021 17:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211208143408.7047-3-xiangxia.m.yue@gmail.com> <202112090603.PxlqXFRw-lkp@intel.com>
In-Reply-To: <202112090603.PxlqXFRw-lkp@intel.com>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Thu, 9 Dec 2021 09:51:17 +0800
Message-ID: <CAMDZJNUBhpu6KLAL08+BKRCJg0JDHNCQAXtNXzcOZwTHzRgChg@mail.gmail.com>
Subject: Re: [net-next v2 2/2] net: sched: support hash/classid selecting tx queue
To: kernel test robot <lkp@intel.com>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>, 
	Jonathan Lemon <jonathan.lemon@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Alexander Lobakin <alobakin@pm.me>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 6:22 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on net-next/master]
>
> url:    https://github.com/0day-ci/linux/commits/xiangxia-m-yue-gmail-com/net-sched-allow-user-to-select-txqueue/20211208-223656
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 1fe5b01262844be03de98afdd56d1d393df04d7e
> config: i386-randconfig-r023-20211207 (https://download.01.org/0day-ci/archive/20211209/202112090603.PxlqXFRw-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/522fbcfdde012bc46d29aa216bdfa73f512adcbd
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review xiangxia-m-yue-gmail-com/net-sched-allow-user-to-select-txqueue/20211208-223656
>         git checkout 522fbcfdde012bc46d29aa216bdfa73f512adcbd
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash mm/ net/sched/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> net/sched/act_skbedit.c:39:11: warning: variable 'hash' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>            else if (params->flags & SKBEDIT_F_QUEUE_MAPPING_HASH)
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    net/sched/act_skbedit.c:42:34: note: uninitialized use occurs here
>            queue_mapping = queue_mapping + hash % mapping_mod;
>                                            ^~~~
>    net/sched/act_skbedit.c:39:7: note: remove the 'if' if its condition is always true
>            else if (params->flags & SKBEDIT_F_QUEUE_MAPPING_HASH)
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    net/sched/act_skbedit.c:32:10: note: initialize the variable 'hash' to silence this warning
>            u32 hash;
>                    ^
>                     = 0
>    1 warning generated.
v1 has set the hash = 0, in v2, I remove it, because the hash will be
set by classid or skb-hash.
In next version, I will fix that warning.
>
> vim +39 net/sched/act_skbedit.c
>
>     26
>     27  static u16 tcf_skbedit_hash(struct tcf_skbedit_params *params,
>     28                              struct sk_buff *skb)
>     29  {
>     30          u16 queue_mapping = params->queue_mapping;
>     31          u16 mapping_mod = params->mapping_mod;
>     32          u32 hash;
>     33
>     34          if (!(params->flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK))
>     35                  return netdev_cap_txqueue(skb->dev, queue_mapping);
>     36
>     37          if (params->flags & SKBEDIT_F_QUEUE_MAPPING_CLASSID)
>     38                  hash = jhash_1word(task_get_classid(skb), 0);
>   > 39          else if (params->flags & SKBEDIT_F_QUEUE_MAPPING_HASH)
>     40                  hash = skb_get_hash(skb);
>     41
>     42          queue_mapping = queue_mapping + hash % mapping_mod;
>     43          return netdev_cap_txqueue(skb->dev, queue_mapping);
>     44  }
>     45
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Best regards, Tonghao
