Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDDC941
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 16:50:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 87F115C008E;
	Wed, 19 Apr 2023 12:50:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 19 Apr 2023 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1681923049; x=1682009449; bh=dLXXL9q6BarZExsPuZVOKkCgQK+Q0o/h/ZC
	r5b/C8mI=; b=UaM2/Vu6CVmlJvk2Kies9w5+uobY+s1IoR3w1Sj3u+ooEMRUd8q
	LxmhYZc1+J0TuSNhUNmVfspelTSBGX5ETTZT3Zzsgh1y6+qFFjFpcA2/ENBStsq6
	rkzlHPSmlJb8kfPt78TDWad7bcDSBVmDCThnPqjGxKOqmxTIuyvN/f+xXxNliG2G
	JP4fOyA2Em0Lqwa/Di/fj4wJGEluXIMBxwwcn1fElSgTBUm8F8YuB7FWRhmdN/zj
	YSt7jOzE4Ks09IvwF4l4tFPLUC343Jy6l8C5/uH05JHc1WgMCXxz4Xn/uyWgn7wB
	thTnv3b2vHH72LBeRyFV6+4PK5/xLMxKgZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681923049; x=1682009449; bh=dLXXL9q6BarZExsPuZVOKkCgQK+Q0o/h/ZC
	r5b/C8mI=; b=Ph9/9UB+7iLMtCsD8z/5yfv+lizXHmTC4VaD34fe6q+/4QMywBl
	kdeVMZDRnib8//0nF/vBxkKB+PVnyN+oO/oKp3o8fS/I7V2SHoeNOCQU6asInTse
	00ZL31li8fFi43+DcmJTMGJR/wexjSW2pfVeA/6NzAoCalBsOCWAJ8LKhepMlnVd
	5YUQYQgBDCg5pCS8cCaBIFhi5oCXNKz0wz01LJFtiNh22ALU2Fdt7F8bvwI2BNRL
	zQXRIuNwVSdlRhprHZNFFSPKz5/MMjaXaH7qHCfOIzQDZY2Bu9gVsZ6kEZ3CqR6J
	GsFBzzqLw9l0B3hzA3petE5fPvtR2mHR2hA==
X-ME-Sender: <xms:6RtAZKwkRz3Lmd4Jex-6q8TomJrTcvuOMVf0nXuO9hYnmRp9NMPRNQ>
    <xme:6RtAZGRBw0D7CROHsS8s0Ia5SkEHVAmJx5ejZ9bQNQMiUYbWeFn4CyGe9ajFjkYfD
    xAYuzh4Vh3lZUShr70>
X-ME-Received: <xmr:6RtAZMUHc_dRyt8QW7i4z0UkPJURFenJ172kNIkl-48388GyCeA7K8BQi3xyb8PBn8ne>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedttddguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeduleefueeggfeitdfgkeeukeetjedvveelieeviedvueek
    ueeljefhleeugefhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdifihhkihhpvg
    guihgrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:6RtAZAi5dPmpAMBmpOKV7Fv4TGe5Bo3n2Qi6cZKjzoc6f4SP3Dk52A>
    <xmx:6RtAZMC8k9RnBYI7tG6dcw7qzAZrJPYvm9p54n-5Axnu6e5GwHfQjA>
    <xmx:6RtAZBJ6YkBx8df13FLqMheggdvduKXWs2pbBnAc_lNH1_57UtP6UA>
    <xmx:6RtAZPNPxS4mEPK_LQg6Hs-hJMA-iHSpqORrgTuDCYUpRAENgV42Cw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 12:50:48 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
Date: Wed, 19 Apr 2023 17:50:36 +0100
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 llvm@lists.linux.dev,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)



> 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>=20
>> LLVM does not implement some of -march options. However those options
>> are not mandatory for kernel to build for those CPUs.
>>=20
>> Fallback -march CFLAG to ISA level if unsupported by toolchain so
>> we can get those kernel to build with LLVM.
>>=20
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> Thanks for the patch! Maybe it's more obvious to folks who work on
> mips, but how did you determine that say `p5600` is `mips32r5` or
> `r10000` is `mips4`?

Wikipedia [1] should fit the purpose.

>=20
> Is there a table somewhere you used as a reference? Including such
> info in the commit message would help reviewers such as myself verify
> the patch.
>=20
> Also, in v1, you mentioned that -mtune is not a substitute. It would
> be good to record that info in the commit message as well.

Thanks for the input! Will reword in next rev.

>=20


[1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors

Thanks
- Jiaxun=
