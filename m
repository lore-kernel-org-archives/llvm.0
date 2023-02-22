Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEE10FF;
	Wed, 22 Feb 2023 08:30:11 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id v78so7929343ybe.3;
        Wed, 22 Feb 2023 00:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JITitTilRwWtZ+8TA+RouLdVmRL4gJWiHTZg0eIoCZk=;
        b=WavO+JxF5t2H6lyHA9auxfHcsBrAcoHviimxf5CHYYFC3iCdGEEiV0Uistm18ClnGp
         Jcxs9k2VyQ/WiTRdwRQrkHEcx+S8vGlX4DUp6jZnyICuvJH7o/WrO38Ts96LXorRpP0b
         jSWYdkZ4fJQ5Fkq70u7sGir5DsrJnAeUh2/cpipuM3+am9rWQnes7IrxXZc7T9v7Ox/h
         tI/SMMwdR/QMA/gpU4lIIeOyOvfwaDdTd4b/66cjgDO/wlf1WGsM5IJMfa/bCIlYoJH9
         cMFjMIcYGnaMkOI97qMSAm0lugWk0RxnZ8onrWURR/DqecfRcsJnMrhNqu06F1BSy4WB
         Q/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JITitTilRwWtZ+8TA+RouLdVmRL4gJWiHTZg0eIoCZk=;
        b=pcWIQEHcOO4ExoqBkrEalIQ55p4xKU+g+CYqApwWvvO0l4doZqggYrc2cTv/X9GrgK
         hPKYmERuIPx0TcPK4o162P7w7EWdeWbVyS8Iqxd+gchqcfiihidclvebv1JXtnDJt3tJ
         URP6NQexoR/Xi/NFURzP1Vffmv1hDo8gOUIkdtI24tlicpUiRFjpAv5Ecx1CTf1XP3+y
         eZuRJQ+H4iT7l4pF/xxLs97tUW9tP1v/u+UmtguPVFoBrhVnl7hwgntiB6YTkdMyi5Tp
         rTt2vPhbc1i4HDAxCo2bVkWCbhwWZeCJZ42MgZo6vdcZcmwRJyDA/6BgZ8I7H1zeeD15
         GOug==
X-Gm-Message-State: AO0yUKWvytxr4hZkSmTET0GYvS9v3r0F7lgmVqAjugBK2ZR4x2SzvVs7
	9eQaJyJGpmuTkFFEzj/qtCGUJzeOPeYssB7aLBg=
X-Google-Smtp-Source: AK7set97RST0PeQPQTJeZTMdfm2YTJw6VZNymGmZPZ9S39UjA/dBb5dfR+sjusjnhrQQYfra71NGN1GJvQwFGNp3mZs=
X-Received: by 2002:a25:8289:0:b0:a15:8c3a:dc72 with SMTP id
 r9-20020a258289000000b00a158c3adc72mr81267ybk.273.1677054610362; Wed, 22 Feb
 2023 00:30:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302221228.E0rmVamR-lkp@intel.com>
In-Reply-To: <202302221228.E0rmVamR-lkp@intel.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 22 Feb 2023 13:59:58 +0530
Message-ID: <CAOh2x=nPyOhBean4gEdTT-ZNDH1Sa3nCbBNyeZPNkGawQcYaOw@mail.gmail.com>
Subject: Re: kernel/bpf/core.c:1913:3: error: call to undeclared function
 'barrier_nospec'; ISO C99 and later do not support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 11:12 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5b7c4cabbb65f5c469464da6c5f614cbd7f730f2
> commit: 74e19ef0ff8061ef55957c3abd71614ef0f42f47 uaccess: Add speculation barrier to copy_from_user()
> date:   6 hours ago
> config: hexagon-buildonly-randconfig-r005-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221228.E0rmVamR-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)

> >> kernel/bpf/core.c:1913:3: error: call to undeclared function 'barrier_nospec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    barrier_nospec();
>                    ^

I got the same one for arm64, the following patch must fix this.

https://lore.kernel.org/all/9c476aa64c9588205817833dbaa622f87c0e0081.1677051600.git.viresh.kumar@linaro.org/
