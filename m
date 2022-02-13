Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60399361
	for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 06:20:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d187so23653029pfa.10
        for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 22:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EwOpItHmF01MRhvNotlE3+35KDc7jISQ9MeSkbZhiOM=;
        b=jFkzqbzVYCGR07q38l2myBRsFboBfEy1n5EqKEWhBOblY+JDTc6uMJv5M/0Yqh6Gf+
         ODoZsbCQwgYHjxO16stXyYoLX12N1QtHH0UzC60uu6c0mRPHIBdLQzsZJQFoL6Y4sXgE
         nuBluOgd/6qypgU/Kq4YN4W0DsYGdpF0+4Tt/I4vJ5LyWNjJ8q/nYeXxfbiZWinvgWxh
         mU2OSQ36r92ioqBcEzIexkjpSr7ODrUvBP3nhW19An2Rp+4AmACnwhFoI3WNIznh1Nj9
         RcR25Zzuj5HApqb1UQvGv5Gz8Yep1AK08ir0bz6X4uBShX3n4t/98k6V5gm4LXn9NK5V
         Goeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EwOpItHmF01MRhvNotlE3+35KDc7jISQ9MeSkbZhiOM=;
        b=fak4zEMmS2Ma8/MIrqoltGGgU3FOUs773k1J802b9vtAeg8AHyElAFr9nibZpHrmZl
         4HjiAYTUTIUB3QrGubFvoJm+YyiMPsvhHXFEFjaBXV4YsRk5QEFzXZX6IX8sFRORVkGy
         n55Prj/ZLIyhS/PQxctsCvEMnuQvsk+N2b+jdpsqX9fK9Mbnh4CBHNYsU8Ol1fQYV/t0
         w4QZYqVEJNT5Er2ghYUGREQmOdoPzqOLrcXJF29FIGB0atWQJUpB3XTZ7NoG6C6Mf51Y
         UIIuwWva4sNGb5hT+x3xrCpZkEnPhJ+e51c+B0ZPbkGCv2e4EQN9I0rkfSk5twUjw0Q9
         Vh0g==
X-Gm-Message-State: AOAM530iONKZzz05kp9eRLjj6NmOcn9dRzxSfGSMY6ft5N2wgvMUnQXb
	SPtd1T1w1Q1koIQniyWn1KU=
X-Google-Smtp-Source: ABdhPJyIa4ReGsnAxEehoelR5HySECXMzkGRdqA9JyAmIqI3eKSGS9Lt7cWdJym49MgU/EgFiH22cw==
X-Received: by 2002:a63:b50:: with SMTP id a16mr7314657pgl.185.1644733227672;
        Sat, 12 Feb 2022 22:20:27 -0800 (PST)
Received: from [192.168.18.53] ([117.194.171.90])
        by smtp.gmail.com with ESMTPSA id j8sm33954273pfc.48.2022.02.12.22.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 22:20:27 -0800 (PST)
Message-ID: <3a944e41-b599-eb89-3da7-0067af60c731@gmail.com>
Date: Sun, 13 Feb 2022 11:50:23 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] asus-wmi: Use led multicolor class for keyboard
 backlight
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Corentin Chary <corentin.chary@gmail.com>, Mark Gross
 <markgross@kernel.org>, "Luke D. Jones" <luke@ljones.dev>
References: <20220211200122.9821-2-abhijeetviswa@gmail.com>
 <202202130255.uwrbJQfB-lkp@intel.com>
From: Abhijeet Viswa <abhijeetviswa@gmail.com>
In-Reply-To: <202202130255.uwrbJQfB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Not sure if this email is monitored. But since you asked me to, here ya go.

On 13/02/22 00:38, kernel test robot wrote:
> Hi Abhijeet,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.17-rc3 next-20220211]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 

Base is intended to be the linux-next/master tree (commit 6d9bd4ad4ca08b1114e814c2c42383b8b13be631).

> url:    https://github.com/0day-ci/linux/commits/Abhijeet-V/asus-wmi-Keyboard-rgb-led-multicolor-support/20220212-040427
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f1baf68e1383f6ed93eb9cff2866d46562607a43
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220213/202202130255.uwrbJQfB-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/860e9e7427b00b9dbd0c35851cecda00be1968f2
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Abhijeet-V/asus-wmi-Keyboard-rgb-led-multicolor-support/20220212-040427
>         git checkout 860e9e7427b00b9dbd0c35851cecda00be1968f2
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/platform/x86/asus-wmi.c:958:5: warning: no previous prototype for function 'kbd_led_classdev_init' [-Wmissing-prototypes]
>    int kbd_led_classdev_init(struct asus_wmi *asus, int brightness)
>        ^
>    drivers/platform/x86/asus-wmi.c:958:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int kbd_led_classdev_init(struct asus_wmi *asus, int brightness)
>    ^
>    static 
>    1 warning generated.
> 
> 
> vim +/kbd_led_classdev_init +958 drivers/platform/x86/asus-wmi.c
> 
>    957	
>  > 958	int kbd_led_classdev_init(struct asus_wmi *asus, int brightness)
>    959	{
>    960		int rv;
>    961	
>    962		asus->kbd_led_wk = brightness;
>    963		asus->kbd_led_mc.led_cdev.name = "asus::kbd_backlight";
>    964		asus->kbd_led_mc.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
>    965		asus->kbd_led_mc.led_cdev.brightness_set = kbd_led_brightness_set;
>    966		asus->kbd_led_mc.led_cdev.brightness_get = kbd_led_brightness_get;
>    967		asus->kbd_led_mc.led_cdev.max_brightness = 3;
>    968	
>    969		asus->kbd_led_mc.num_colors = ASUS_KBD_SUBLED_COUNT;
>    970	
>    971		rv = led_classdev_multicolor_register(&asus->platform_device->dev,
>    972						&asus->kbd_led_mc);
>    973		return rv;
>    974	}
>    975	

Bot or not, thanks for the report.
I'll fix these in a v2 after others get a chance to review v1.

Thanks,
Abhijeet

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
