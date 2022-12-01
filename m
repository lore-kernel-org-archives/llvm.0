Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABAA20;
	Thu,  1 Dec 2022 18:39:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id f13so3839374lfa.6;
        Thu, 01 Dec 2022 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYaRO9PI35gTzGhdOcV/YfgtlN9nUtye2NlqF+jNYQw=;
        b=UjkeQFrz3QbcPwePtkweRC9KPQatIUo5z9lOW+pGcGhVY1w1yCZtpcdR8VUoeYPTE5
         mmioLfxQ/aeWCG/Faap+lW2Ds8eDFr+wEsKVWm46pF7ubrfCHHwRa0IldK0GVjD0oLJv
         wjEMe4DDqqv4EesQUpK4ERPqjvN6NOFd6sbghESf2CDlW/raN58zfAHmqPaAQleKPg8s
         CwSbArBoDAasWP+DE5tegBu1abcO1sXLgSvYnBMy11O7D2k7TAxT+Bybt0GjhdBvvmDA
         hjNLX6E2JnMPFBK+GPhm9UjjKLo6I3P8gFyO+jH6tdWK5zwl3nkvhfLm+csXwwEhvWxp
         jQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYaRO9PI35gTzGhdOcV/YfgtlN9nUtye2NlqF+jNYQw=;
        b=ArBAFDyW+8uzskJ49Mh8yY1PXJI71tEs6Fd/pLU7ttuDmghSLkQ3KYO0tHDtzr3mo3
         cSwjF4SPyD+l+aSPF3WL9VZ+34MNhtkkZWUpJ1XxNe/Afhx+oIsSiSrPOI6w5DeBXK4u
         0sRcf2sJXDA1CAZhuHljmGiqhcpgXTEIRjlfTfXt6Ev+/Byy7739f95zPMEb+F6S6Xuj
         Krj5dpufZA0ULEyKCMBk/hZPoA5wFoq662a2/BB0gKVu8DYScZGIVsM7jQRRiVBpz7tE
         8ss2aj3WDpC5SgVUPqn3z2K797n6+q94cT9zwPpOsUzKHfOqN1UgTMQlQf6f+/dFitJw
         PJMQ==
X-Gm-Message-State: ANoB5pmHyrWwxS4KTf8zY7shh1klurDI2EyLUWRagWysSV+TEaY5mA7r
	abUkQR1XPkS8tbTC41tg9JZ0+oBQ9kllT5LsIoo=
X-Google-Smtp-Source: AA0mqf7p7xs6RTiUzR3QACv8tiodiitiMNsYToKb1a/lk/chJrI8j8iItaXZBVX51X3f2/FWXC3pJQejB7hsAZ+7IZ0=
X-Received: by 2002:a05:6512:708:b0:4a2:6d30:fef2 with SMTP id
 b8-20020a056512070800b004a26d30fef2mr17308367lfs.324.1669919973147; Thu, 01
 Dec 2022 10:39:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212010140.pIueEBNb-lkp@intel.com> <20221201091610.524f7786@xps-13>
 <Y4jPubD53yN32OUL@dev-arch.thelio-3990X> <20221201171331.42f05097@xps-13>
In-Reply-To: <20221201171331.42f05097@xps-13>
From: Mikhail Zhilkin <csharper2005@gmail.com>
Date: Thu, 1 Dec 2022 21:39:22 +0300
Message-ID: <CAC2txAZpGooRGSxh4x9T7Y9b4OvfePx5=YuJoyaSwk1M_EvwtQ@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __udivdi3
To: Miquel Raynal <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, NOGUCHI Hiroshi <drvlabo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l, Nathan,

On 12/1/2022 7:13 PM, Miquel Raynal wrote:
> Hi Nathan,
>
> nathan@kernel.org wrote on Thu, 1 Dec 2022 09:00:57 -0700:
>
>> On Thu, Dec 01, 2022 at 09:16:10AM +0100, Miquel Raynal wrote:
>>> Hi Mikhail, Hiroshi,
>>>
>>> lkp@intel.com wrote on Thu, 1 Dec 2022 01:46:36 +0800:
>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
>>>> head:   01f856ae6d0ca5ad0505b79bf2d22d7ca439b2a1
>>>> commit: 9b78ef0c7997052e9eaa0f7a4513d546fa17358c mtd: parsers: add sup=
port for Sercomm partitions
>>>> date:   6 months ago
>>>> config: mips-randconfig-r033-20221128
>>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6=
e4cea55f0d1104408b26ac574566a0e4de48036)
>>>> reproduce (this is a W=3D1 build):
>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>>         chmod +x ~/bin/make.cross
>>>>         # install mips cross compiling tool for clang build
>>>>         # apt-get install binutils-mipsel-linux-gnu
>>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D9b78ef0c7997052e9eaa0f7a4513d546fa17358c
>>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>>         git fetch --no-tags linus master
>>>>         git checkout 9b78ef0c7997052e9eaa0f7a4513d546fa17358c
>>>>         # save the config file
>>>>         mkdir build_dir && cp config build_dir/.config
>>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash
>>>>
>>>> If you fix the issue, kindly add following tag where applicable
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>>> ld.lld: error: undefined symbol: __udivdi3
>>>>    >>> referenced by scpart.c
>>>>    >>>               mtd/parsers/scpart.o:(scpart_parse) in archive dr=
ivers/built-in.a
>>>>
>>> Can you please try to reproduce this with a mips toolchain as advised
>>> and send a fix?
>> For what it's worth, this is likely our bug:
>>
>> https://github.com/ClangBuiltLinux/linux/issues/1635
>>
>> It sounds like there are some merged LLVM patches that should help but I
>> guess not based on this report...
> Ah, yeah, thanks a lot for the share.
>
> Cheers, Miqu=C3=A8l

I could reproduce the issue and found that reference to __udivdi3
appears in this function:

static uint32_t scpart_desc_is_valid(struct sc_part_desc *pdesc)
{
        return ((pdesc->part_id !=3D 0xffffffffUL) &&
                (pdesc->part_offs !=3D 0xffffffffUL) &&
                (pdesc->part_bytes !=3D 0xffffffffUL));
}

There is no LLVM compiler error if:

static uint32_t scpart_desc_is_valid(struct sc_part_desc *pdesc)
{
        return (0);
}

Currently I have no ideas where does __udivdi3 come from, because
there's no division here. Should I try to rewrite somehow the function
to avoid the error?
I would greatly appreciate any ideas.

--
Best regards,
Mikhail
