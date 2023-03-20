Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3C4C6A
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 18:50:01 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso13464718pjb.2
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679338201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb5WAjnV64TvIqVog+ALrYqWwxpAYRDfoRexx0FHgtM=;
        b=P26WYm2NWf0WPj3f9FGlGwX0m8mwWNzYTAfzTeuhYb2tHlkAFxn2mVMAH473OO3ANT
         7vKoG8MyNXfWNVhiQcNRGKGUbpU79vDYKbw1Kr0WFv8g0GExqpaTgVKzKjeB1kUHS6o9
         QUPc+PnnpMvxu6on2j6T9QepUT6VNdKWeKucaXr1lpLbjvK1Duf5RBmV4yxqgNpaKw2c
         hJx4kk4VfJ2/mIVuiNi3Lf+I7SRTppK1q66hVY57y9kvE65FyRgSKOUN+gIE+DELu1f1
         /vc16H7piCvg04UVFaBHWjP6JfWqS22tgv6O8EeYrwq/tjhiEvR8aCyAhwqTa1rH0Nx+
         TO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb5WAjnV64TvIqVog+ALrYqWwxpAYRDfoRexx0FHgtM=;
        b=RpcPpr3R8SqH/AQ+fToQBDPkc06i8q8aRlfXPcycO5oy77fwwwMiFiEJJ19Ec2srOJ
         Gu7H+lcBTuzhodRpesmEVE/P48O4RuTTuvBSA94R6SW5SzVNRFt4fyeyGwwWOqdn6RRM
         IuPnu/JUGRJ0VJrXPOM2FW/ZjXMEXxgI6w78BoqYbIcroNzgULivZS4v5aT/BQtp3Dmm
         4BGG2d7RSWQ45rHfBWJp8d1VJSi9KSl06sFjrg3cIjHBMDA5GtOHZtZ/PfdXLR0cI3sS
         rbQGUnmFwPXsyQIIJZAT3jBCEao1oQ4wXQTvGNBykmt7TFU3usOgQFDHZOMYShBG/r63
         XrPA==
X-Gm-Message-State: AO0yUKVR6IUMvBmNBhuBpJGQaoEQ8nTqzMGtPnnlW3Z20A1epKAXzlqH
	omZ1xbFHeV4Qd/kdeVDzQNKPknQ4gNsDNPYkYImDdw==
X-Google-Smtp-Source: AK7set9eH0azJC4yqfUlAGq8InyKfmgAzfIqpPamku/x55+E9k/WBoIumDFLsuBW5qWPFIbB3U0nG1RRD8hPh+MZTlk=
X-Received: by 2002:a17:903:452:b0:19e:f660:81ee with SMTP id
 iw18-20020a170903045200b0019ef66081eemr7432644plb.2.1679338200618; Mon, 20
 Mar 2023 11:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320145513.305686421@linuxfoundation.org> <CA+G9fYvNEThYX-c204_knup5G_1vA27j+HouS-n=HMUsdJpC_g@mail.gmail.com>
In-Reply-To: <CA+G9fYvNEThYX-c204_knup5G_1vA27j+HouS-n=HMUsdJpC_g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Mar 2023 11:49:49 -0700
Message-ID: <CAKwvOdnmwkoeToovShcmfpSAmBmKDTzZNv4R2jFA37hi=+ynaQ@mail.gmail.com>
Subject: Re: [PATCH 6.2 000/211] 6.2.8-rc1 review
To: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 11:40=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:

Thanks for the report!

> The bisection pointed to this commit,
>   45f7091aac35 ("powerpc/64: Set default CPU in Kconfig")
>
>
> Follow up fix patch is here as per Christophe Leroy comments,
>  powerpc: Disable CPU unknown by CLANG when CC_IS_CLANG

Greg, Sasha,
Can you please also pick up
commit 4b10306e9845 ("powerpc: Disable CPU unknown by CLANG when CC_IS_CLAN=
G")

4b10306e9845 is missing a fixes tag.  I've filed
https://github.com/ClangBuiltLinux/linux/issues/1820 to track getting
these -mcpu=3D values for ppc added to clang.
--=20
Thanks,
~Nick Desaulniers
