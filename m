Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC3372671
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481690; cv=pass; b=LzGhQRhDgzd4HjGaGBZitmZSCDZ+EKicn30J2U+1OTqWuLep4RttO53JQTM5wui3Bj3f6+CQyAWzcEOmFq130p+eZmS+4WLRHLegCt0myzTjrF3YN5pcRv/XUpQ8kplxBke5MTqSrkGyOKwxneJL9tbaupTYq0bzC87jAuTnGLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481690; c=relaxed/simple;
	bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od3Sl8y+EfuNZoKTasErAdkBA/FOiV3IxSZoya0HTYw0UtPDhFDnDOJ/KMSK5JO+qpeDC4G0zbRwLySXQIMPO4HNAJwUT1tkms9skAd8MNOZrbclNPVueDTd60sVUEm0ZefSgaGN8IM/gP55sNB/RUKKgjDdgbkngFkawaXWY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAGNmv+z; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAGNmv+z"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127337e3870so199851c88.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHdXiF5Vqet6gG7+XozgrEI9WgNwR0A1out0qnE5kGOR0urc1n7m87auDgWDr+R1Te
         WpDPohd0ddMxBH4JyB02P5sv4ozZp4GDh/qGefIYGv1iqcm+BHJI/EAELEToD16/Ptw/
         6uGqZRyobegv1QbQoU9Y6cE9exVQI+6kepXhRr9csJADg53aIy6Bj++Q9Z229yqzEy0u
         nM2NmjjGmPnrEg5kdb3m2JbQ6AMEka36lcfIDAhsB7+cBTP75jyJV9VsrCJVU6EnWSLu
         p11/Bup66aPlxZx0TkoTDoyxw8QHrzVcWhneHnd4ARcBIfDlJ2u9t2yUNu9BQQNJP4vc
         NWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=xFEZWXxyqfMZI3IquW6SYAfCUWqdzJp1R/u75RBil20=;
        b=IAmfH/KimXey4mq8oFFW3Bt+tsuycLJyXCHmQRjWkPBoUghO9eefwEbPNKJ990B2Jm
         KpA4AxdozcfxTPtIxFwt8ScFt7Y+7i9W7+hNn0miZQkedLJIUoBlj8n2nh8TI54D2g0c
         Ajm+GZBNq6zH2MQTDNtf+LJ4nVnPN/Qb76KXcsrup6etXs25WJi6Y5rajTZf6J7SpR2G
         +h6YgU2qAqaUidotFTS196sDV5g9OdxgNWjCqtLT3VGdoxQEmhpuMME4a1JZeTCehIdT
         Zy3l6ReKJbtuPlsFrZJUsjyh5Xdnp4QFDuz5SzALfRpeGJrjWKIngmjyUnoMyawyzbrB
         b0qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=NAGNmv+zSpYI/gce68yJYDW9SghueJpnvbVA7FhhLffW5IURVrco0R9tHwcZuhHnFw
         u46rLv2jHa6Adq9VNzKWLcPARgICZkK0P2KmDqywgrua4IoVh63WzY7WPvvSZA9lCnoN
         HL0EP7gKVLFrcMJO9Oqdzm1hUYCLsq+tkJIVMOlpD6Pdg+3zM/MprLfT3zJ5tQdao4xm
         Wlp5QleLTmYOWtNk3cTLK8FjGQIUzsffyU6hHRnVrhkIMUxMUoAyG2UtkeeV4Wdzq7pO
         0fNodNYiiOZSEE2MdGjXPxpifm0eQSLzr9wEzrBHhmdOYxiXBhqVoQdO3gQH72oyaNBJ
         poaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=GhJ8zNQMSis6r8yN6didud1y6mw/krhJuxX9ehXDwIHIXmvBk2YhaotoQN0Oe/awMq
         sfRPhfp0sop2ikR3ZgNwM7tBtG+UVFMhI8WNf257iqyav5EpBm2M/DIck7DPItyvKpTm
         jNUdlbs33DOWtbTMRo4sHcOurwNkBG5CaDzfI9ILrbZ4GxLuaGqOAywXwxTHqB1camz3
         4toDFd2BjAzt7F7ToaPfEOEbwmrywfa7LMxoWXc7mkekhMUxSMfCMP35HitLHhxrOl6I
         fir7ZZYyuSWR9xtNJKEjU7II5yOND4x8TBRQGbx1bxcgfyOVL7K3/gYPwGqZmxfxusq9
         4oFw==
X-Forwarded-Encrypted: i=1; AJvYcCXaVPL5JRTNCuTUfZxb/Cor643vK41oYLVWHmpiz9u7+f95I4Vgf6KnX29eRg580qtGVcAd@lists.linux.dev
X-Gm-Message-State: AOJu0YyovlnBJZJwrHCwOeURhYOZUQ7WyWAu9koJMIQM6+SdR3jPXSib
	kyfK0Wo4Ll8u2Y/1wQfu2OQQWthqPB8Ol44f/kE369vhK6SqXVdXHTR1wi64nVJ5wM4XlF4kd46
	SnSJL/6NLm2jI/mQ++3at7KaxFHXFRNw=
X-Gm-Gg: AeBDievPjUAvqDOEgDr9+ah32+fgXKbU0VMjzTGWUMbJcSXt2BKI3+ufD1nSNBi6OVM
	wg4264BSl3GN4ngzwWnXKS1lOl52w+RaoVAnDdROCdp5yaDTDx+Ged5q3SuGGWdeO3eV+bizvF4
	jwNYSvHt9UbydpmTVq3b5D8u8xzxYAQPFA1FrD4jGeMrd0xcSSucqNIB8qQ/mQvWEvlLdbaHrhn
	VTArwdsBSvyg2Ta+hW7sLpJoB64bbPH8OPLjTcTIRv+z9Wwlfcm7lLdkzet9KUZlmwizpGZYXQG
	gAnRFy3D4fhN56y5w4UKmSPuzHaOQc5ElLRdSJrkmLSDrV4fm4v4vbQjxjb8X1ixvM190ncVngA
	jW9QuwFKoWqPiIguOEGqIoEw=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel
