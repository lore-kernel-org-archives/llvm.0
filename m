Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1512ED17B
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787266; cv=pass; b=OLK5Jy6SY6me+P0z1hpYq7osLAiaP2PzE2LL8/0M5+8NTjfCse2I9TCd0DAShC+ProkDCaXRauohgZddAzU96lMXYkOsHH+tschIbnavEx3V7Yt/QjJr/KO5RKxr1r3gxKwYTNYGsutZOu7xAV5DZuK+fQucucbJ+qcgh2lVdK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787266; c=relaxed/simple;
	bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYaw1fOZVlpJ1YObM1wKXzO2PxbYMzkG6eQHPlS8r5XPou5DG+6Bhywp2ldG/hzL5rYca3Pyfk6mo/5G9vhlTVBdNbAMRyONECh6jFFZkatbNxkIdVUAb7ZI0nscnTH7xmQ49jOMvQq8f/4LcLhtNLcd7qznvotWBzW+UDj2Xrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuXcOtC5; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuXcOtC5"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c373ee97fso140245c88.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 09:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776787263; cv=none;
        d=google.com; s=arc-20240605;
        b=PM3chRFekthYIzZEjKREM7Nzb5Om+3P692QWXHSvVE1O5rsEdwD5t+SQt1gZtz+Orx
         NeuS5LDAJsYuORWPHygz7K57ZtgYDfk1h7YC084AJezBkB5sqZU/UL0wrbqlTUQoLpWj
         0qI3GMSdRau43Tk/oOmrNaeF4pROsfpCuH6w88kCxaBOFgcI/xgt/GEbXxKo/hh2RnRG
         oDEdlNuIli0bbp27p1J3d26IPH16onSfXCHOAo7F8OQyhhWodsCbvr81dv8JRYbrZsch
         pQHW4IihxiKlDs9wm1H7iQELPDkZjxFuewpY4aCaXFLaR70m2eLzfSKQ0dTzUYjLA15G
         YS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        fh=cgJztIV32gSwlFkpoxLHyGKDMPClSWWqizHbdidjxZQ=;
        b=QMirC5U5jUH7WavBoV75W12zhfwyFN1lVOMEyiTzDzUnlHXP8pOOjenVf/xYjcPwt1
         pZdOa0dqaZp0eASHdEAbl8C2wYxMHflrSgMj4VGOcx7ihUJAxZ8dyqOUTblAH+VZIU8S
         kGOVh1ifmt0Hd0t/99Zbu/LP1xd6jy6jWtKMSsdlm/NouyVYPUto/o2SeoHtysdvWknm
         emPmnvuDP3a4vbn7SVSGLvt/gZWWadg+EFPwhvjQySSv4T3k3w1moEEnbXEwzVb7TARs
         kCdFUFqzUvSa27Eke+mxvBD/QO7TNdLTTqAzN7T8zJteoEGep/++UdAPNa4iOoFM0zew
         NWGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787263; x=1777392063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        b=LuXcOtC5TcQ5K2HNMuxCApLF44KHEWSxSSDAxrHudqioxuqz8O892bCBAvcpVgua4Q
         fNkYZ1qM2m0e8RwUVtR68Nl2ybVM4clfbQqs8ehuN/KAVv1y8wHKUn7L6rrP/1keJI40
         VPIkpkpqv66U+4htA/v5QsFer4l6OSGfYa5epDsZL5AfoTP40PmeEh5EGdstrDqpD6Ch
         JkM5K5HMupOSQ5bicUDNontlvbyvC/B6GBk4pmXHmH8mEWYHOQxwzJG5yCKBfdTAiJaM
         2HqKtxXWWtUyJWodgekuGu4e/uN6f+75J6P54MdJaMKWxGUJG2t9izFHrXb5w9IlqjuE
         LTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787263; x=1777392063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MeXsRITH6uYFGjSpv8Ce/kRxmKLtDNrVZWdnDLB9ZX0=;
        b=oGCjls/FvgQ9VVuhdPbLaVihMkB5GwxqfXfm1U8Jk1N7ElZdbuxNZCIe94Gv5OwOL1
         bVZKRjxSmtGdhanpjJzrLVUNaSJ6qpTWykggwGOT9CrbpII8ok0j5F6lIqArpA4juxag
         92rvNjxsn9KhQSP4pzUDn4htBq+vi5BjBPIn+Ud2sZjpQbBN66vDM7a6pXBY/BlSGZes
         0U5zCYFARQnYh8yf6Svo9zXIFJ249lfgPw7c2Rp7LzopR3O4qDPj8D2OHgAwCa6KxWYt
         pKhfujaRxXdqSwEJPXmQUjqITTQfxlHoYaLZkdf040Sd4d/603BltqYZPUozmmLvONaz
         FtVA==
X-Forwarded-Encrypted: i=1; AFNElJ923jBjey0IphoPDvGJj4GzrHPvNdO41ed+pgOUSHulbl1Fk3bBVHS2ONFCl6MsYvuOxWhN@lists.linux.dev
X-Gm-Message-State: AOJu0YxHwIA1UyBTTgfA4VvMF+Aq10Zf31JKzbMYfBJnwXcDGd2ktHsQ
	AWzGiMKc1e3453CPPHxt8oOdm3dXCuKad9ZDMcaK4Enzd2U3HafBIiK1865WQByiwrC01dapvO/
	H4BoF4qKVk/oMnIuJAz496HGg+1g8x8k=
X-Gm-Gg: AeBDies2/vacW4CIqE5jo+12FXWmvycdWzpASg2Ae8Dcjc1em83GCTz59qneH7dnWc2
	Eqw0Dq7Ch+qQyL/n4836CIfeyL0VwG85hoRdByZM0/x6xhnsZQUH4tWzRRk8/N4DpvML7V/BGJx
	HDYSxJZXHJovTUXxdR6X/6WJY+Tx6sdpkdZndKvXRAFypyvUr3KDLSkUVQsLg3hpUbfkEUpZyS1
	UcGUeYZboyIRKp/rpTdIveXnWminatlmOChPH9ZB3QramBVSiwJQ7S5Kog/LBmdIXI5wWn7biVW
	+tfw6QtUQZOxFOaidja89qppHI874OCUkEMBUJOo9O+WnJf0kozHgcYA5bI+W0vFaZufhd35zOS
	DIIktin5txYvlt2NaTlt1mH5q+UOUC611Lw==
X-Received: by 2002:a05:7300:1352:b0:2de:6c38:707a with SMTP id
 5a478bee46e88-2e47883d4dfmr4268950eec.3.1776787263012; Tue, 21 Apr 2026
 09:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417152253.2312961-1-mkchauras@gmail.com> <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna> <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna> <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna> <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 18:00:50 +0200
X-Gm-Features: AQROBzCqVWnAUPlPD1KfzhDI3x1JPlxYKYFHLCv9W-Ks_qXhO7vsrFg91y4pahA
Message-ID: <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:54=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> The stable support is available on nightly.
> Refer https://github.com/rust-lang/rust/pull/147996

That PR was merged for 1.95.0, so it is already available in the
latest release, no? Or do you mean something else?

Thanks!

Cheers,
Miguel
