Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AB7A
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 18:44:50 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id d3so13218639ilr.10
        for <llvm@lists.linux.dev>; Tue, 17 May 2022 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIAjTESKXuKYbBQ9smbJ5hCbcUOqEoo/oz4gEnlQ78Q=;
        b=DPgmtPQWVfA3vIbNMZQ3dlB/yGfi3Ix95EyelERGa2sVYKTgoWsnPHlqe6MI7KR6Za
         Xc56f9NFCWdGj6A+8h9DLBTvnabeJSS8noRHcYS+/rq9a3LyAygydGbD+KWtpZm5UPNP
         3Rbn+rlpL3qwU5ywElBhJLGd0PAQ3JbAe6qc+su2arsmnbAPJYc+hPbHNv+fibtYsI/i
         Mge1RL/gj77qG0xQuzam2uUrun2aQO49inccAs2JNRJexspMRIfi+Xe8EhybHburMiFg
         +FJfywHSoDA/NwOp78r56JLl5icJd8Fo7xBKwdt6VAlkI09mcW4AIpXCJXrIk30h8fJK
         c8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIAjTESKXuKYbBQ9smbJ5hCbcUOqEoo/oz4gEnlQ78Q=;
        b=c3gHTXaUVQxCi/384Ah1757Sbx0SCir4uK1cJ24IZmWpZlLINbFPtwIWg/70k6rHf6
         oIJdIOY74F/B33qBfOaQyUFdl7juwGzHh6muvsH8fq+90V9bPmgBjXj8bcKpZtIHsDKb
         qGsi5xhg6IrPguj6Fm1tzW9ANhj8wJN0YHMpjGyxV4DkFDDp/GJHUJ6YpI8T3RS569m8
         8AOPVENwMKK4XCRpipAJ2Hx4oye9lPWqUZHL0SP1G0VgTAZ396xVfOkG8+Me0TJs/Ism
         IdOKl7wVwgHvYkRgrrZY8dR4mG/UP5075jn0LImYS5WxqB8LWT3PAoOhleWRdwLDKRo+
         Csdw==
X-Gm-Message-State: AOAM532j150ZGqVGeRSlW0rmFR4iYazG0+G2zm62dM3c/UsmWus8djPT
	JNCPV/JIQVFw+IdqLFLMKS2hktDWIWLjepNB5xQ=
X-Google-Smtp-Source: ABdhPJwuI7b6xuzFoTXjG7KE+Q7htUi038IRRyyz2kzkuHY0dU8pIBnJ7MCtA6HBtUEHkVk0DAzG9BsMMgZrbNM3E/s=
X-Received: by 2002:a92:509:0:b0:2d1:2766:1820 with SMTP id
 q9-20020a920509000000b002d127661820mr5123564ile.6.1652813089835; Tue, 17 May
 2022 11:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220515064126.1424-5-linux.amoon@gmail.com> <202205161820.8rHIcsvI-lkp@intel.com>
 <874f08d9-e67e-f7f3-4d98-89bdb8333ce5@kernel.org>
In-Reply-To: <874f08d9-e67e-f7f3-4d98-89bdb8333ce5@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 18 May 2022 00:14:35 +0530
Message-ID: <CANAwSgSAAmM5iUdeS296dOOhDGN5EfFHkpSMudw6BXrw4oH7ZA@mail.gmail.com>
Subject: Re: [PATCHv2 4/6] thermal: exynos: fixed the efuse min/max value for exynos5422
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 16 May 2022 at 16:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/05/2022 12:42, kernel test robot wrote:
> > Hi Anand,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on ec7f49619d8ee13e108740c82f942cd401b989e9]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/Exynos-Thermal-code-inprovement/20220515-144336
> > base:   ec7f49619d8ee13e108740c82f942cd401b989e9
> > config: hexagon-randconfig-r033-20220516 (https://download.01.org/0day-ci/archive/20220516/202205161820.8rHIcsvI-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/eb50b0c2100fabd6d09b87abd11f52c5295512e8
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Anand-Moon/Exynos-Thermal-code-inprovement/20220515-144336
> >         git checkout eb50b0c2100fabd6d09b87abd11f52c5295512e8
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/thermal/samsung/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/thermal/samsung/exynos_tmu.c:929:40: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
> >                    if (data->soc == SOC_ARCH_EXYNOS5420 &&
> >                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
> >    1 warning generated.
>
> Ah, I did not notice it and it seems code was not compile-tested with W=1.
>
> Anand, please be sure you compile your code with W=1...
>
Ok I will try to resolve this warning in the next version.
>
> Best regards,
> Krzysztof

Thanks & Regards

-Anand
