Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7247A0C7
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257015; cv=pass; b=Adb3T+mM630S0zvq4KNMQSHRD5d9u43XLOG8p+6FaEWGh8h23i5DgETpIkDHUPkbRsAYfdjMkA56b958H3RUf+cmW84fRjT/cMf45OfGYk0yhDQ1HsWVt7wN8q+KXC+YIRJagfj7+pd9WJ+cbdB+xQioy8kqalQ39qf16GcB86Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257015; c=relaxed/simple;
	bh=dtC2b9rE2+PvqyfvIQpFBFFgI4ZlT+seDQ76UBcyXhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1FeLG0ukfAtwQKbaDNKzj75K9mZqvEnqUldEjfCHuOArknWC1A3W8hfVxLzE5+JPlygcFtobeWOInaqq9RGATM9RxTpW1pZ9maCZAM48GU9rw1SE3sjwD3K6okfwVe+dwHesn9bx7YYX5U+b385DO+DdrOmr2/1cVm4peCEAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT1rIb2E; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT1rIb2E"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d5862bc921so10386225ad.1
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788257012; cv=none;
        d=google.com; s=arc-20260327;
        b=pxNc3GipjxRT9T2ftSPm/7UoB5kJ9nQBcl7L5id+eYcopWRbCQ6RDxyfYZ+S2BZmVK
         wKKomRv3Cny/AdHOWwjI3r5ZmAu/IBNU8xphDUrkrVAOPdCJxccC78dSg/qfhLd94n/E
         9DDD5uG0Yx0eKRXPrZ/IMXbYqCF1xNtkFUDeRjLWsOxpysxgWUNYDjMMS99pNnm5ok4K
         rOKxWhpVTZMRdDATJOUSF2TNdif0imN0Bu59IIsfyHAeHGiP4xjDoca960BCsI0uXecP
         eLOR+7xQ9oNcfwU+U2vlnwwbVVqDJSC0GuOZO7Mn1M9D2jK+Ka8WWfyz0QIrEBq8ravQ
         MXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        fh=06z5SvDV23Cj/CsbSXbZWysHP19a6zoCToZ8VLtQGH4=;
        b=jo+LRZMBJKlx3ukwYEBjm0uyIT4iv0JVuzEiCC/lTLHCIjkYm9333bP5pFPpCF9xiQ
         3OBLKnUef3wi6S4EjXPMaQP19aeDp30ncfMVlpMWgyDMjYLzIOEG3mxpviqkyK59pI/0
         k0nFC+uz3fZmVjLqT7LU2l6Fc6n9lDb5kmXgiFt1D4ojBqzFjjHB9aOgPtr9NsophFt1
         Ca7EcAdbZAL6eVS1vOSHeX10dDuCP5O8XEognmPZIbD+luF1OUW7sQxE0lm1noRH/zYB
         MGe/W/QXhhbN1UA5hnnak+d8CjaKYSO/uKK0r8TbD0pjzaYxMgoFlMSdq1lZmasjiXIs
         Refg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257012; x=1788861812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=AT1rIb2EvcgNczQvwbIp1zwHMs4QyMk70Govtk9KA9bWXA/cT1ZSdY3Xa9G/QR9Kux
         Vd1GzjCcwyDpE1W+VpkI5dPY2SRIg5N1GpOSihycJzViziTvVrxaw8+UCnohdntVKXve
         s8WG3OdoMWG9gHGgE/Q/ZguKqJt3tGYkThHyFRXeGxQRxYecMHa6sSnYPUWJlq9zqorQ
         TW5IqCbJX6r+QSVhtyAPIfyNT6NdrnZH8VmjYNeq+LhrS5SbG6hv2k/S0l9k4p9Pcii4
         0src/8/fA7skmFiktpg6KwU8BRIUphVANOwlL9gxCO9jo56ew44RVOFYfI/jz5du+EZX
         taqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257012; x=1788861812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=SGD9w6Uo+ZIaDxbq98ilJmkf1xshFElv9kdD5ogtyrdvCKH4Xuqf8k5eku0eT7DHmI
         6gDta3t522WC2Vv7b1SjGcIFafdmGpGzpScK6Fxg6TRbKVXR3PxK009w5kQvg4aXbajF
         kNEQIPZFW4twgCd9ShKyL6xoT0hIbYWtb1xd7ynR81Lj3Erohxk/BPQU7hcgLNKuS7cK
         Kw8Cp8lgoAMYMPLMJVJF5iUzcgsdQ9XFDE7T/r02YuNcXsXtulP1M6vMsUF/MfKwJ6iR
         zMO4UD2dAMaPt8SYtWvOvOnK//N6SzX2aTnnNDYwcLJk/ayeooFym5gYeJO2Xe1JuFuA
         5MTw==
X-Forwarded-Encrypted: i=1; AKwUvBzVjXq9PBSNBhy1jx/MPpu2rgWMg1wL7Nahngebx0W2ogP5nptMikTFzSWHMWCHw1uOZWxx@lists.linux.dev
X-Gm-Message-State: AFuF++kp6KXBt20Gmk0BgB57B7oSvLFV1zP6xcva/F+ZaljnDA3pQea/
	7jxAGTACfmJ4Q0/31GQopmC3nMt53nMR2tmF3ZOlmmY4iPdtkAeqf0cs1thSHwnGaL8wXBxEzrp
	ySa/EMVcQQNMwgclY+XgZsGovPDhfi+4=
X-Gm-Gg: AR+sD11qP33clmQjl276BnoMaG8HR6ivj0281zDZ1B9Wb3FxbouGOI3YdMlebYxYnVt
	FOO6WkyQHoTuMhe08xk20zcbgMoSbMPaO0IOCHQP+viUw51tbOAgls5t2bv9q+8+dYnLCqytQ3v
	z6UOM9wI85j8Q28u6s1Ulf0nU7YKk6tdrUbcCG0TEADJSk7lOkbFXHkASaxxa33U+J4axlQFWSI
	uZoxEPejW2EYCoM7i80EIKRXTYQe2KOzfnhs1nIGKR3vzTMLHBepZDf43/fCMJXPfmNdZpvTPHo
	uFdDYwzEQ1p+dLklganxSOc7fmRy2/qIgqfmLn7Ka5HtB8uqChKCUWY3umbu/P8sDeWeMWWD9uj
	B3v+XlUZBw94QSAORkklywgNzS8hyS7cceb097NxNTwcM05TRVMeJcSZaM3Uf
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr274123155ad.0.1788257012245; Tue, 01 Sep 2026
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 12:03:18 +0200
X-Gm-Features: AcwNN1VbNKqeV_yey9Jhr55AwO_DusZQ-wcQLGmrDCepzJ3Tk4JUYrXX-Z1lHAo
Message-ID: <CANiq72m0xHD1YTADnmQ-fqMPSNHrMGwfPBbT7V4crBgu7B_ecg@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Docs: changes.rst: rework
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Pereira <danielmaraboo@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:17=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> ->[v2]
> Ditch the name change [PATCH 1/5 v1]
> Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
> Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
> Ditch footnotes in favor of a column [PATCH 4/4 v2]
>
> [v1]
>  https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailb=
ox.org/

In my usual go-through-the-ML exercise, I noticed that the subjects of
these emails look a bit strange: one is missing the version, the
version is at the end, and they seem to be out of order:

  https://lore.kernel.org/all/20260831151605.638172-2-manuelebnerli@mailbox=
.org/

I would suggest using `-vN` in `git-format-patch` or `b4` to handle
this instead.

In addition, if the changes on a given version are local to each
patch, you may add them per patch instead, after the `---` line, if
that makes it easier to track.

I hope that helps.

Cheers,
Miguel
