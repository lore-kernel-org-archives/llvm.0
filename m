Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221C331204
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546229; cv=pass; b=dLC3IR2XlS73/E5Y6FcSzrkid5zulg6BLijO9aMVoV77Ju5T2bNiJ0ai3HhgEm9Vj7Dcj460+O/YuSrzFV2jal+sEdKzXwj21qoZG0vdWFCVBWsKpELOr2MAByMp2NG477m1ILFiesLMdPpKtkcMp6iAsjKB0r+aZ74Nf91hlLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546229; c=relaxed/simple;
	bh=OpxH2sJ/fBqNWjY82rtfpbqgi+6tguV8c1lJED4a7JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtC6nAo37mJALIBeT9SBIGZhDp4TLozc0xWHuUdsgri6JsTdSVCnNqXngOHFH0VHlIeRIqqLY9kwKR9GOZpfHO7WuDkhdjQMhEVWMzeH3QJfIZawFs6UuXDJG6skCCo0uMRpRIv2ZMD0y4o/I8DHSdBL7vjNAzscbWb2pkNGtd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4S3QNx8; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4S3QNx8"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12736a0147cso94938c88.1
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 10:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546225; cv=none;
        d=google.com; s=arc-20240605;
        b=XCAtm6SxHBgj2CfN8XeONUyWLscKmCv/4OzkaH9Y6lJvN79kIaL4HGYBCkP+vjhs+E
         7wDw01h8syYtikEJqa1Uua9MgdfqBdSrzQz+4tIMKnjRpvOztkh4MBjkOunVYGO6Mams
         76ojTfE3MKm24r1YRe8C7n410jpX7+TbCla447DhjIQU5/zW/W5w4adypd9VqVB6pa86
         Oo1STuehteWtFmIFr/7Hv/yvVFE5YLCa+ufKRi5rtcw9V8+ETrMtvFa0WYHE4bZYPuWN
         gGoF889KM5+Vc9i19Xg7+duKiTVoGW8P4C2w0YVhID3rlatRNi4OYaffVXroV5+TGxfR
         gSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        fh=jm3ajwV+IyaIArCO/eFXxc92td3NrWafiIjgT30+Jks=;
        b=iuDrTAojLiK8WYnSwvwWoeJNdYBvwCHmb0DrJmfmf1DJIfIVr9PrABo//e9fHKfHFP
         a6B2ApBx5Vrxrej2PwyMy5wpeJauqoCycu4u1csvjdSm5KSEmpO1Wd3afJaROzWf+aFB
         n6sYxpfO08afusVrbogYChg9vsuF2e6tlAbaD67NnLSdd62oEM8PFJP3XvoWaZTZQkxR
         LVDpa1I0eSUwc+AYPJ1raemXxBXqavpy3bCUPx35hxicm8RPaBhnG6aFcx6FhVISD73T
         NoZlH69NdWKYG71HcDtokWo1l3oRZyLgvtqVPxjRu4sbdZHnqI/m0bY6WnP/f+TwkNBA
         zfIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546225; x=1775151025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=H4S3QNx8+8bp4exIirx+XozZ0fLMDKnqHqYH5cCcgR23HM/HTSdAEISzaYITlClPOh
         fQQ4nDczzfEcl67qGTeRRmQnONArT4uz+MqH3ErdeI8lFjIiqAbaNHzIlDqhmzfidPja
         74Ev/g/UnvNU/Y4j0m5Rxbow3Vs0x6Q9FZebNb0I7/mU6fvpLdTNWxEb/IoGe0WaCt6k
         Ry8EHlaldudjinG9A41przOzUd7s70bbUqyAXSGLnvSqB1BAsOIJRsN7wFsTNkqlSgLK
         eGq4VwhWOROhzExseMTLpZi+ZkJa5IER3llqgidtpG+uhcb5SZZO9STLW18gr9e0s2Gj
         bVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546225; x=1775151025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=QGfR/hNNG7Go7l2OSiVZ5To4+eJsTCfpCdkUO45d/lS48g6paoKqTYngXkKSTpE+NB
         He6IJyyn2Heb1blS3QRVmueOs37vQiMXX3hBR9BmjKVaQB5mQyLF9QFhizR6FwVXdyL7
         gMC+IyurSGQWP28gPr8QYMxEXc+kRC7R1NKU0WJ6nHyrRz3LZdeZ9qrHlMtgFaJeBN2v
         4OUycmnCop9wh2kdN4DNx8keAc8HtwFfJ3osl2DzH38K5H/Q4GgKfsJD8LpkNiraqMkl
         EdtGj7QaA5HTBbYq3V1UWMWYYwAHuIa49V725cwLkoFCrJh2Ptc6JHBeXHLajiwKm6hx
         peLA==
X-Forwarded-Encrypted: i=1; AJvYcCUmakwSZlqQ5qwLcSHhHGVd7umHt10uhooDCgHrwjhY6DbmEOqHXQs6cMSzVsx1is6Rzfn5@lists.linux.dev
X-Gm-Message-State: AOJu0YxEkgSY75BNnFGyN7xFcTmj2dEEgLBDj+Bvs57fb81Rr3+/Y35Y
	ZNByHmOtAkqsh1tqUfj8rMiUp7J0S59Uuj3dVA7IM4q1Alnf30KkxTEgP4cVbsOyUu04gzfWO4O
	kiFBevvpQTKBmgzZuDr9RLUqVkIIpXF8=
X-Gm-Gg: ATEYQzy+gKUBJf28oKzN4RISNDvgk0/JBWo8jpckeI0vzNKV9+aNF64CYH5UsWZQ4+n
	9Mfv3m6XOUSocnhDVbe5BDfxCM3F8+MSl+izA3U8HWt2jMVulIw+uZLIYVtI7/VWicCwzC7+RCb
	9mI0/f5NnpBYDjoLguGRATUXqDTrOLPEH7HMffNAJphfFfJ0uAFSM6eCKfjCpo7glGwSKVcGIVF
	uuSZWLkxhdxSeC2quEdkhOVJUicNpDEv/IRK7/p1Qap13d1w5t+p7BP24AhN1gkcPCJCtY/LMty
	xv16/iBHHROaQYL3F3NswFo45YqYxJpWeIDNW8KPzqeYLmtKMPgOR3Lgkl+cwZ3FKkA5ri9i2e2
	6Gqd58xYILhaqpalL0MARX9U=
X-Received: by 2002:a05:7300:d50c:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c164162eaemr1927580eec.4.1774546224910; Thu, 26 Mar 2026
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
In-Reply-To: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:30:12 +0100
X-Gm-Features: AQROBzD8mk75r53XPOqmRDfmWXx9t0jf0bYbL_Ww497XzqV4mLKwGQ6QIr12vEg
Message-ID: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:18=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> I'm not sure if this is still true, but I believe it used to be the case
> that the -linux-gnueabi target has one behaviour for enums (fixed size)
> whereas -none-eabi, the size of the type depends on the range of values
> included in the enum.
>
> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
> behaviour, and I think there were cases where Linux used "enum" in
> its UAPI.

Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
`rustc` target, and indeed:

    #![no_std]

    #[repr(C)]
    enum T {
        A,
        B,
    }

    pub static S: usize =3D core::mem::size_of::<T>();

is 1 for that one, and 4 for the other.

Thanks!

Cheers,
Miguel
