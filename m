Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63133215
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:57:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id y10so11980523edv.7
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+IqwQrreaIW02AJS03/xoNmlaUlmZ/vkoMhCtmeGgTY=;
        b=d0L1mFtnsWjkMbp1xeTZO4YLbtRG3luGFyq51W2lvdnCjC90b6HlUw4oDmRuFvyc7+
         +A622rpmAHOWESqkmAWdkdku6NAY3rBo51vzQSC4MTVZf9SnvDMflXXR8cU5H5mlyjKn
         E7FDjggoKQtZkCz9r2UOuDgfuxS8EHOPTIh+/DiLFNKdH4oCVaQ+qFdOTwRx/2qa/D+v
         2LjpknmG3SuOnKQrAQ//g48ottG98DxLBAJmUR7GL5xvdQdBjn56WpYuomFsoB8yes/d
         owzQU/zU7Xr1vUI2e6FzpQ7b4AcXh3iMhaX/1a0ZD/r9s1ujHtbLHlLeLJF2DYKXDmw8
         dhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+IqwQrreaIW02AJS03/xoNmlaUlmZ/vkoMhCtmeGgTY=;
        b=KurGCIhsAxRo9mP1Ljg+WFwz1pVrSHgJVlhzQXfrkPGu443dERofAmtxuVJEPID/VT
         zBZmBEfW/ynqbNnhSZGXpSQwjlnfbaY8tuaNAFy0/JoXzxrIzMQ6YkT6oz5hM2V6+Mop
         4fhIaRTBLulXny9lY7UYDfOOzw2dyU064i2I/dCbR1tTT1uyHmjY2kpzJ1q06SRqD9iL
         EnXDHh7Kax6bcvfEMGI3EUd2S9W5301epnZFEIWUUd+wzS4wF0BOAFRL9GF9cZYg0Fji
         Ynsz3p4AI2ge0t2f9SEAR8wAag9BgD7IRm+2V9eR96jHBzZirTKBjzYC13etH/jZqylF
         2SlA==
X-Gm-Message-State: AOAM5302SEV2++f0nCCLY5KTjjFECjfQoS6ZOP1PTY1XzDDr1W3RvuBY
	eoydIT43Ic8g7Na6PS3Z9L8=
X-Google-Smtp-Source: ABdhPJxr0dkQZIrXSHuQZKoprFCK5SlvrCOgT6kBLhnZZAJezIzj7jUgr6MBFobFAhnoto6sj+vKgg==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id b5-20020a056402138500b004132bc64400mr4520809edv.94.1648299421216;
        Sat, 26 Mar 2022 05:57:01 -0700 (PDT)
Received: from fedora ([95.180.24.23])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906780400b006ce69ff6050sm3504795ejm.69.2022.03.26.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 05:57:00 -0700 (PDT)
Date: Sat, 26 Mar 2022 13:56:58 +0100
From: Aleksa Savic <savicaleksa83@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-hwmon@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) Add support for
 Aquacomputer Octo
Message-ID: <Yj8Nmhw7gITs+I6U@fedora>
References: <20220326101250.8076-1-savicaleksa83@gmail.com>
 <202203262032.UaIhk6RY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203262032.UaIhk6RY-lkp@intel.com>

Hi all,

Sorry for the mess, this one is on me. :(
Please ignore, I'll fix and resend a proper patch later.

Thanks,
Aleksa
