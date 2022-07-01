Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C473C1E
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 15:53:00 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id m13so2721443ioj.0
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LzXeIvBxx6GI/Lyk138nEeMU6sPsd3jvzy63MAzXwsI=;
        b=cKuF2gH+5LadJdLFrhcfEzuLjBl6vF3OqUooxlt1QmoX6l78/Vf6/6AspZySiuhqeQ
         /Zb2gW4qpA28T9hm0jPv7xnplR/ZP7RDw+slP3crjPOetcAFwqnmogMbPJguOkG9uGCJ
         ACz20N4OzWjgpPtUinURPcXUoV7XsUYisyvFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LzXeIvBxx6GI/Lyk138nEeMU6sPsd3jvzy63MAzXwsI=;
        b=xRbZ6GDiRxtMeX4au0GgcCXrvEfzREjUMMbDd4DMocB4Ke2bXpsn7qUE4BmgfdGrh9
         cYhr3SCZbafRwmSDxZgZYoQMe33vx+ZWHNK9BTo5/I6uLyqJIKab+K1crT5hJITABwSM
         1nH4je/RPOkQpmM36lLtlatf2ZJRhsacVn86CmIO1kBmNq1ivqJqFCvqwDI+ME908zeF
         wf6lIquIQwdaw90Ji+qMZte1mwXzNU46u03RP/j3QlgMLTzap0WYzjg+a4obJzF7Eci1
         CY7SZQnLmslxOJyWluNNLC7Jv0RPx3Ty0tOy20zYNXJ/3LAAwQhj8HJncGE4dZdjF13U
         R6bA==
X-Gm-Message-State: AJIora876/NLB4mO3Vaydtut0YWvi6YxJwOvrcwSwalhqGKnDKeNe210
	o5Uk9sI7QC98rpO8HyGt1bpfDg==
X-Google-Smtp-Source: AGRyM1t99/8sqWY8h/eslURajhBzWMPihHsM8jd+Nc6p2K4kIDh7WbVb/iHIOY3+Fp1vbR/Esqm81w==
X-Received: by 2002:a5e:890f:0:b0:675:80c2:fde3 with SMTP id k15-20020a5e890f000000b0067580c2fde3mr7476850ioj.10.1656690779093;
        Fri, 01 Jul 2022 08:52:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x17-20020a029711000000b0033a29ec646dsm9936712jai.4.2022.07.01.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 08:52:58 -0700 (PDT)
Subject: Re: [char-misc:char-misc-linus 3/3]
 drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <202207011658.rHJFVLWA-lkp@intel.com> <Yr63Zyvj49o8U/ti@kroah.com>
 <67a09516-ec1f-d0b6-c027-fd52159318ed@linuxfoundation.org>
 <Yr8VIT2vjvGYrbmR@dev-arch.thelio-3990X>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1c13496a-9e45-38b6-1563-c09d412cf576@linuxfoundation.org>
Date: Fri, 1 Jul 2022 09:52:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yr8VIT2vjvGYrbmR@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/1/22 9:39 AM, Nathan Chancellor wrote:
> On Fri, Jul 01, 2022 at 08:48:11AM -0600, Shuah Khan wrote:
>> On 7/1/22 2:59 AM, Greg Kroah-Hartman wrote:
>>> On Fri, Jul 01, 2022 at 04:49:50PM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-linus
>>>> head:   3776c78559853fd151be7c41e369fd076fb679d5
>>>> commit: 3776c78559853fd151be7c41e369fd076fb679d5 [3/3] misc: rtsx_usb: use separate command and response buffers
>>>> config: arm-buildonly-randconfig-r006-20220629 (https://download.01.org/0day-ci/archive/20220701/202207011658.rHJFVLWA-lkp@intel.com/config)
>>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
>>>> reproduce (this is a W=1 build):
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # install arm cross compiling tool for clang build
>>>>           # apt-get install binutils-arm-linux-gnueabi
>>>>           # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?id=3776c78559853fd151be7c41e369fd076fb679d5
>>>>           git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
>>>>           git fetch --no-tags char-misc char-misc-linus
>>>>           git checkout 3776c78559853fd151be7c41e369fd076fb679d5
>>>>           # save the config file
>>>>           mkdir build_dir && cp config build_dir/.config
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/misc/cardreader/
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>>>>              if (!ucr->rsp_buf)
>>>>                  ^~~~~~~~~~~~~
>>>>      drivers/misc/cardreader/rtsx_usb.c:678:9: note: uninitialized use occurs here
>>>>              return ret;
>>>>                     ^~~
>>>>      drivers/misc/cardreader/rtsx_usb.c:639:2: note: remove the 'if' if its condition is always false
>>>>              if (!ucr->rsp_buf)
>>>>              ^~~~~~~~~~~~~~~~~~
>>>>      drivers/misc/cardreader/rtsx_usb.c:622:9: note: initialize the variable 'ret' to silence this warning
>>>>              int ret;
>>>>                     ^
>>>>                      = 0
>>>>      1 warning generated.
>>>
>>> Odd, gcc doesn't show this for me.  Shuah, can you send a follow-on
>>> patch to fix this?  The warning does look correct.
>>>
>>
>> gcc didn't complain when I compiled either. I will send a follow-on patch.
> 
> Unfortunately, GCC won't warn for most uninitialized variables by
> default after 5.7, which included commit 78a5255ffb6a ("Stop the ad-hoc
> games with -Wno-maybe-initialized"). They will potentially show up at
> W=2 or with an explicit KCFLAGS=-Wmaybe-uninitialized (it does in this
> case):
> 

Thank you.

> | drivers/misc/cardreader/rtsx_usb.c: In function ‘rtsx_usb_probe’:
> | drivers/misc/cardreader/rtsx_usb.c:678:16: error: ‘ret’ may be used uninitialized [-Werror=maybe-uninitialized]
> |   678 |         return ret;
> |       |                ^~~
> | drivers/misc/cardreader/rtsx_usb.c:622:13: note: ‘ret’ was declared here
> |   622 |         int ret;
> |       |             ^~~
> | cc1: all warnings being treated as errors
> 

This is a bug and a good find. ret should have been set
in the if (!ucr->rsp_buf) before going to error handling.

I wonder if it would have been flagged if ret were to be
initialized to 0. Something to experiment.

thanks,
-- Shuah

