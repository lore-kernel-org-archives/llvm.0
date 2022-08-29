Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A3258D
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 08:16:53 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p187so5955255iod.8
        for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SR2zs66VfZ+7cR5z7A6IvTd2O6F2fkE2TEOJvg0bu0I=;
        b=PTiQgniWppKvxkEzmd65ZhoEsm6L8mv1pdTOpYZYU0um2dXu20/Ay0lDQZhlb3y7YV
         Z6PrrCJid38YfRz/WBeg9z+M+MgKo2emiGXW7xNTpmnapY2372F06UOxTa8L0IalIx2E
         XG8ccXtuMXVBc6b2RUop8g659t17ZKYoX43+E9LyrD0eao3ydclhyqH1iOfLwMGssORl
         QhUwG0jExizZ3Vd6E2v3Vw7mH+6VbVqhAjFmQnf10oPCcNz0BHn8SKJo8UAg64RLr9G9
         wU6Mw09FG3hk7EXhiaFsVfExIr66P0WWArwI3M9KB8ei62rxRzyLXyPbDHHuqGWbrH/j
         M8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SR2zs66VfZ+7cR5z7A6IvTd2O6F2fkE2TEOJvg0bu0I=;
        b=RRkRCmlwJchgL9MmoyqhFrOGIJ12rdpOD1KgWoQuIPHPLRrMHVhrhazuC1DFq4W3IS
         bvLF2cbrS2THw65p5GnMETBsuKbEC1av6GWjJtIb2xVog+4NjVGaMFLSzACakbCuFfcJ
         +ubEN0JzYyI3P3EXYrFeaMfo4NCKBK+P2xs2kD5neXDFWZpJKIBW8in6PiKzHOTnvHNk
         01BMzcIV2m/D3Kn1QphEr7BIJdzMJfd+3Yq3SYa96X7+k9WeiGOw18QZzEqVm+wxHixt
         TaC+NCliM65QhoULIQW+L+GEL3ZPulDqkAlR0o/11/8G5ffMX7upeodd6IGCzLGSjDVj
         yjqg==
X-Gm-Message-State: ACgBeo1GEq2JnYCpJsDn3DfVs7c48mALa1MJ6XopCI4s4e67/xP6M1hS
	k6Uy15WAeH5BjyUW0fuzQAaphOcrxkTSycWokAIJ3ODE
X-Google-Smtp-Source: AA6agR5w+knSfmVPltVfcUUnZ62s8C1vDjkSljRB9xvXicYviWK7mE+Hfygcmzi/6VAoy72EtqSMkaAc7FqcDgPzgQI=
X-Received: by 2002:a05:6638:4117:b0:346:b5e1:383a with SMTP id
 ay23-20020a056638411700b00346b5e1383amr9940873jab.264.1661761012858; Mon, 29
 Aug 2022 01:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220828192920.805253-3-lkml@vorpal.se> <202208290605.gE9IGbxE-lkp@intel.com>
 <90ae872b-9da6-f5a9-56e0-5a61fe3b84ed@vorpal.se>
In-Reply-To: <90ae872b-9da6-f5a9-56e0-5a61fe3b84ed@vorpal.se>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Aug 2022 10:16:41 +0200
Message-ID: <CANiq72m+PnnVojGx_swBaNF-zVv0XGyXbPn5C71h06jHsTeUpw@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: Battery charge mode in toshiba_acpi (sysfs)
To: Arvid Norlander <lkml@vorpal.se>
Cc: kernel test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-pm@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Azael Avalos <coproscefalo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 29, 2022 at 12:50 AM Arvid Norlander <lkml@vorpal.se> wrote:
>
> It would be nice to see these warnings locally, anyone know how to turn them on?

Compiling with W=1 (and possibly with Clang) should show them. Or
doesn't that work for you?

Cheers,
Miguel
