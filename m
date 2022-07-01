Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5B010F0
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 14:48:14 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id h85so2483721iof.4
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YwnHVKpuUoSoXVCF1lKKK3GjSIrTJeRKu+Us3h8Q3ag=;
        b=d9MbkHqVYvRR4GV8BJLwFGJL52FX0K6LlXBnT1DuAxsz8q9iYl/78fB0bYpCjjKiiu
         lo59M1FjBQJXKreUsGH/XYLCcTMehBLMPDJ/nRM9OpKRuT1EnqF0ay/wvjDdWWgUviP8
         OtlmvLyd0BmxASW+aHatje5FY3Xrvia1XRzTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YwnHVKpuUoSoXVCF1lKKK3GjSIrTJeRKu+Us3h8Q3ag=;
        b=c2mFyg9lQDe2b5SYmRBdTfQGFHexjmhupSIs0NMqnk2V9AB3aUFChKkYf9ikxCzRR5
         BlkWF77NNOFDdYxS9sW6ZwUa3vXUA+R9ljBVdraRmzIVeLhajlrkVf4MP7OyrDSVWh13
         15gIXNOj4YTF49i/SiY5hEFLlJuZ8VHlwCeG3Rhg1w/GvX+wTm8k5abHRfZvuzjG0nHA
         GnbLn5b6PrPP/uKKThUBMohcuAz1jbIMvxwMlKqsPFmUre9RpfTMZjmfg1JaSdfeyaQO
         +OX4F7/ZcrNgSr1wKcwDF1ral1qIZ7G+F7o2vshLlluqXqUfrabWN6+x+OG3lHS2rvt7
         pO9w==
X-Gm-Message-State: AJIora8o9zobK3sSInfGhHO73zfG0hZNvYJd+mv9OOHdHExDgbkzrwvJ
	p00be4VtfzVIp3ySXcfOO7xqWQ==
X-Google-Smtp-Source: AGRyM1u6oOUbaGYqbLkQvZ3X+2Cs1/BvXAhACtYr6ULnMfiWbLLjSLRUcAEobfjrk95df2W3U7mYHQ==
X-Received: by 2002:a05:6638:12ca:b0:33c:c664:64fe with SMTP id v10-20020a05663812ca00b0033cc66464femr9084174jas.67.1656686893371;
        Fri, 01 Jul 2022 07:48:13 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a11-20020a056e020e0b00b002da99df289fsm5401982ilk.48.2022.07.01.07.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 07:48:12 -0700 (PDT)
Subject: Re: [char-misc:char-misc-linus 3/3]
 drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <202207011658.rHJFVLWA-lkp@intel.com> <Yr63Zyvj49o8U/ti@kroah.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <67a09516-ec1f-d0b6-c027-fd52159318ed@linuxfoundation.org>
Date: Fri, 1 Jul 2022 08:48:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yr63Zyvj49o8U/ti@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/1/22 2:59 AM, Greg Kroah-Hartman wrote:
> On Fri, Jul 01, 2022 at 04:49:50PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-linus
>> head:   3776c78559853fd151be7c41e369fd076fb679d5
>> commit: 3776c78559853fd151be7c41e369fd076fb679d5 [3/3] misc: rtsx_usb: use separate command and response buffers
>> config: arm-buildonly-randconfig-r006-20220629 (https://download.01.org/0day-ci/archive/20220701/202207011658.rHJFVLWA-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm cross compiling tool for clang build
>>          # apt-get install binutils-arm-linux-gnueabi
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?id=3776c78559853fd151be7c41e369fd076fb679d5
>>          git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
>>          git fetch --no-tags char-misc char-misc-linus
>>          git checkout 3776c78559853fd151be7c41e369fd076fb679d5
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/misc/cardreader/
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>>             if (!ucr->rsp_buf)
>>                 ^~~~~~~~~~~~~
>>     drivers/misc/cardreader/rtsx_usb.c:678:9: note: uninitialized use occurs here
>>             return ret;
>>                    ^~~
>>     drivers/misc/cardreader/rtsx_usb.c:639:2: note: remove the 'if' if its condition is always false
>>             if (!ucr->rsp_buf)
>>             ^~~~~~~~~~~~~~~~~~
>>     drivers/misc/cardreader/rtsx_usb.c:622:9: note: initialize the variable 'ret' to silence this warning
>>             int ret;
>>                    ^
>>                     = 0
>>     1 warning generated.
> 
> Odd, gcc doesn't show this for me.  Shuah, can you send a follow-on
> patch to fix this?  The warning does look correct.
> 

gcc didn't complain when I compiled either. I will send a follow-on patch.

thanks,
-- Shuah

