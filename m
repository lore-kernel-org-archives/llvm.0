Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173152C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 20:17:15 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id az37so39046760uab.13
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 12:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=posk.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o7/4mC/JYrlbPMC5mTMOllHOhZpcab+DyW/7Z03WsSM=;
        b=Ioe0wKMbX4DHin7wlvdFlj4MEKfvWB2K04WzO6Bh1WNDiox9t4LgjI8c+H59UvnOs6
         g6OJS605i7CqxgVciSjzu013fB0T99jq7C3tGtm7+eI9k0pfTM3hyyliFvZ4o/oGmtVk
         /ONIaqa4lZKQgcZvJJ+g4wfgw8uXgPUNkGfTVznvQ/5dtw8rS0Gf/8/91Edb3bMSGhTt
         U9kWMe1MxmCVQIFNzrhgIuqDZn6NmP56OL75xQ4enV86Ocy9a8rjlBlw/wdZkq6Ve+DZ
         g9ZetGIVTlka2LWRrP3MZVQwNeGzf+l+BciyCZSQzS08couN26QNvInhRbxU92Vhm8m1
         vZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7/4mC/JYrlbPMC5mTMOllHOhZpcab+DyW/7Z03WsSM=;
        b=3jFHDllnNniz8A+kIempjVFTGJJdUtlgBJC46UXXaGLSCWAgIKkt5LDCelm80UwGnM
         FGIWnLnjhrHU4k3B0oUBf+4HnbOOl68w3WM2ThL3+w3Tr2ES7sgAnActC8lHhH0mvnpw
         VkqGdHVvxVwdRgBTWNEuTad7OgqGvdXLHDMTm/OZiXqM5qgsUOlUWaE0f4bcNY4BnL7W
         /dy2g9LSE7gkbSw9kVUhR53ePxukSt5kPoYXWAd5AVM3LcvlGAAC1QD01HRqqvWI0qdk
         myav/VRtoeqAFKznbzSyAWNTuo2kWvNypH2+PWauEQTjgX03YM+vCSHmrsBxaosEQevQ
         VzCw==
X-Gm-Message-State: AOAM533yqArLEoHVRpeOPGVrxmrFAPr5WTp+zgZKx8wNET/1d4oCkvCq
	bVZ6RdSl3/6j2WLCT57AYP4tFh/AocNSmNfp9Qq0CA==
X-Google-Smtp-Source: ABdhPJwuthN9TtqqxsMgdNkzCamK1Lw39KDHjTILUpDel6l8BKQ6fkW7mkhQZL4NTeYgq1rYLOB385Q4dvNrEQ7NK0E=
X-Received: by 2002:a05:6102:dc7:: with SMTP id e7mr133295163vst.21.1637612234866;
 Mon, 22 Nov 2021 12:17:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211121212040.8649-4-posk@google.com> <202111221834.Q9LmeisY-lkp@intel.com>
In-Reply-To: <202111221834.Q9LmeisY-lkp@intel.com>
From: Peter Oskolkov <posk@posk.io>
Date: Mon, 22 Nov 2021 12:17:04 -0800
Message-ID: <CAFTs51Xr0jae345RA=uYq5-ZwPu4T20CcPBeRQqxGrhL73enfA@mail.gmail.com>
Subject: Re: [PATCH v0.9 3/6] sched/umcg: implement UMCG syscalls
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-api@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Paul Turner <pjt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 22, 2021 at 2:02 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Peter,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on cb0e52b7748737b2cf6481fdd9b920ce7e1ebbdf]
>
> url:    https://github.com/0day-ci/linux/commits/Peter-Oskolkov/sched-mm-x86-uaccess-implement-User-Managed-Concurrency-Groups/20211122-052209
> base:   cb0e52b7748737b2cf6481fdd9b920ce7e1ebbdf
> config: x86_64-randconfig-c007-20211121 (attached as .config)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e455791cacec2b140558a717d2b8b07f5561a251
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Peter-Oskolkov/sched-mm-x86-uaccess-implement-User-Managed-Concurrency-Groups/20211122-052209
>         git checkout e455791cacec2b140558a717d2b8b07f5561a251
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from <built-in>:1:
> >> ./usr/include/linux/umcg.h:80:2: error: unknown type name 'u64'
>            u64     state_ts;               /* r/w */

I figured it out - lkp manages to compile uapi so that it sees
__u32/__u64 but not u32/u64. I'll make the change.

As __u64 is actually a different type from u64 (long unsigned int vs
long long unsigned int), I'll need to make corresponding changes in
other files to avoid warnings of "comparing different types" sort.

Why does the kernel have both __u64 and u64, and have them defined as
different types? (This is not really a question, just a complaint).

>            ^
> >> ./usr/include/linux/umcg.h:91:2: error: unknown type name 'u32'
>            u32     next_tid;               /* r   */
>            ^
>    ./usr/include/linux/umcg.h:93:2: error: unknown type name 'u32'
>            u32     flags;                  /* Reserved; must be zero. */
>            ^
>    ./usr/include/linux/umcg.h:101:2: error: unknown type name 'u64'
>            u64     idle_workers_ptr;       /* r/w */
>            ^
>    ./usr/include/linux/umcg.h:107:2: error: unknown type name 'u64'
>            u64     idle_server_tid_ptr;    /* r   */
>            ^
>    5 errors generated.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
