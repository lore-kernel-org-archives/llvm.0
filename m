Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A17A
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 09:19:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M42fG-1nTgrZ2iUS-0008Qs for <llvm@lists.linux.dev>; Mon, 14 Mar 2022
 10:19:37 +0100
Received: by mail-wr1-f43.google.com with SMTP id p9so22752976wra.12
        for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 02:19:37 -0700 (PDT)
X-Gm-Message-State: AOAM532Fw95H/La3DFyBJ9MBcDBSSGZnCBfpmYBZgpKyyJoneqsYKM/i
	jOZrhQKAG5U1p0gsNXWlL4z94SpzLZzNmhOBe3I=
X-Google-Smtp-Source: ABdhPJw1TgSEGWls36dsqQHki/rQyFgnONCGRQaK0Rt+A3nm2L9IHD+dXHVrauXi+iRe3bEroixu/aUQvpON/ku+icw=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr12910202wrq.192.1647249577205; Mon, 14
 Mar 2022 02:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203141621.9GAoyWx1-lkp@intel.com>
In-Reply-To: <202203141621.9GAoyWx1-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Mar 2022 10:19:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
Message-ID: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:for-next 3/5] arch/arm/mm/copypage-v4mc.c:70:3:
 error: implicit declaration of function '__flush_dcache_page' is invalid in C99
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Shi <alexs@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EJP0jUuxJ6OzMv/zrM/Fq8aZNlr4x8g67n9Bt2agEuEoSVSTUjZ
 vhG52KPsx4XSfHi019XegwdE4uUIYOQK9rdyASUC1azKpNDMYXoVT+/+8GbbNK4WHTR6cS3
 DlkeN2zl0Fh9onyJ69uWN03ZkZgsgQeFFMA6LLFi47fOCsAekYJjOMxksZI2qrxwPnYkQRj
 yJuL7dn7Dp9CZ6CoVBkrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mGhw521z/qM=:uskDeFPCpMKNdZz8KvucbJ
 HNTR9Io2yNxmfWWoYGjALy3NZxXXHmMLJWS79SgbdZZ8Jc7qrZYOTSeoqZ99crngLcVuwKo8Y
 /AABI2z000hA/L6zayj6Z83ZjecAeiaCpqHcAObTlILzsvrxEkkmG3u10Yl2eSigsu0sVS97T
 sKl070d4kXq9suxUNNb3A2mSSXkD0hnSjShSIHM2Jv/OXVSMnDlzxVltmMamx2HHnpclMVQxa
 chjwyZs2o1QDjn0WVWobNHfRaSqWQ+ikacnyNpLueqoMHuvBbi6zKHAmkndIQ2OTmFAQYhQ6g
 vWkn1MOpcOpnjjSPST0AZSyZsJGirT47uU11x6xkc4WTH7zLkG9Iufa2JtY4Mky79kVXLkmAq
 THgGF+7A/Lzwoq9M4oNBx2AS8SIL/JF/NAxtsj2mkwbwp/6adHlrYZTNKurUBY8nRfbAIAg2f
 Fdz2/Ph40HZCfk3fiPK4o9FWR8R4Sxq/NTPnKjyr22e242Z5tS2mrHw49JZ0q3JOLlAS1Y1xP
 XhvAcZ/cSUmmSp8wEt9+AAohRIlcPMykPH3i3xSWTI0ggfGEhuejYRr992CP8VQknxRtSnUiM
 oNGb2T1Q7ULaxnMx1XzVhDoxUIC+KkbJPeaBt++0mSxN3jfa7sS/MfhHlWPvJI8usVyh/q5LP
 2izh+HsAw06zf1zG3oelbydu8DW7uAvIKnYEgZ2qtT31DJGI9aJHH6OdIiXv168a8cO8Y7SvF
 7mnK92+RojRg3X0f1U0B97lakpk3FXSw814CSCStyIy3Le4v6c7heJ8LPVKCov3d51GdPr7oZ
 yUhJDZWINjiEjkzC0bgzZC9Kloogw+S1cbQmnkw/65qvMhqlGU=

On Mon, Mar 14, 2022 at 9:06 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/arm/mm/copypage-v4mc.c:70:3: error: implicit declaration of function '__flush_dcache_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    __flush_dcache_page(page_mapping_file(from), from);
>                    ^
>    arch/arm/mm/copypage-v4mc.c:70:3: note: did you mean 'flush_dcache_page'?
>    arch/arm/include/asm/cacheflush.h:292:13: note: 'flush_dcache_page' declared here
>    extern void flush_dcache_page(struct page *);
>                ^
> >> arch/arm/mm/copypage-v4mc.c:74:2: error: implicit declaration of function 'set_top_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

I checked this, and found that the configuration was already broken,
what changed is just the
exact error message that gcc produces, so lkp flags it as a regression.

This is a NOMMU StrongARM1100 config, which has been broken for a long time,
and already have a patch to disallow that configuration because we ran
into another
issue with NOMMU classic processors last week.

         Arnd
