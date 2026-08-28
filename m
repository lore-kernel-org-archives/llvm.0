Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E97146A66
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936212; cv=pass; b=c72amQVG/5QKrcgMZtQ2PHMo/CnUbC/6EBau2mYjbkQsNPbcTYA5oUxYEhyqxM8+fiJznIW6wqf+LMvj3sVae/WGSqtfs9m69oaEEjvrF3GZtPtNI3T8PDe96iUBV6JGc5c+FfFUxVO6IHoVl+0s7d5Nyc4J1XdFc07tQezTUK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936212; c=relaxed/simple;
	bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+IVA6/AgL7s9FxYPQkeVTT7tMmSAitcFfKj5dpvSnpSHvmdiWE4M2jIxsxgbQlnmFe3wl07X3gsMIjwMcOwRDiRCTdcxI7KkAKONcijRehdJKtaanH3tQBXNFYb59iy4Y3Zl14oEzb6nnqABQbpIluqFEOE2EAw6XOgzF6xJ/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvcs0zbL; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvcs0zbL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cecdc24b1cso764625ad.1
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 09:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787936211; cv=none;
        d=google.com; s=arc-20260327;
        b=hKxqxkeAWvt60djd83u/hADBO4fOEHtuF+lVsbYupY/4uGodxZ4STLgTHxUSCJVXnc
         8oJTyDiIehzRP51Kdz/zZRBYlN1cBm7U7W8mA0CxtDMNHBKS9IwLo0bl0KRSvcwRpTD7
         PP6H5xI9xuDkYWwlmCwF9J+Jb05omjkLfH5x4XjKXBG0yWfDz09g70apMj8VU+ayeyCF
         CGSDrHkGKEweGj/TFgYbzDeIxm01+Ylnw5CZlZ0AWCUKkugP5qon65OoRbSOW7ohUY5w
         rw3dhprVVwUFbrgtTEujO8IBVtfpTQm8VzjNV+JrpeP9IbCw5oTaElinCHhDUEjG6hGB
         DNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=mJtct61h6GEzOLVkyYIybkioWrHNIrqb83X/xfSAyPA8/M4OW8LBe7VRNDnuQef/3w
         gurI6j7mgfFhPWGLIji9W/59GehNgHTAtWUwdoNqDp6tow6XdMXN6ngclasTJOrHLoqi
         9i624I7HWPSfl3w5c/e3MeUMjmmr+tV155143YKwrv2hig2cTIZh+QvACmk0KRtbvnxP
         O6N6+oyPE9jv+IGXLKzGNYIT6L51swYVMghvMy9LlHV6khIs0cQ4g7eCDj/xe8SVVpjo
         G3ml1Cju3IOEUwGXOmbdMjR7QbudeC30NdRBpveaXxb2DPheP1czwelF7tWYYE4xP24O
         L+ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787936211; x=1788541011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        b=nvcs0zbLGS66AW1+DC11DEcvI5g0TzebS56tnT013l4e3OPbjZnhBAb/x60L3lDrsW
         5raYBFog6jmslIzQKeQ7btBECIjEvdjCOtQJjLldQZGO9rQJ3Hp0vL55xtgLsLmpY1z/
         vWofBKUe5wMWNYXzb5v++hdyrfyVy621xTqKDT7FQScvpyc12iauM+eAVc/Ffr5wCwkS
         OvqIdkjnxOCAzUuxbmSUeRcYdem72X2msb1Wgutnc4m52P+Xk55Jcq4bVo9OBAEOQsqe
         ztfBXo39+emr+vJHfKQAHkTJq/Lk7t6q28mIJuwj/2Ra5CoOovTk/m2qcq+T7ZFqxxjt
         nxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936211; x=1788541011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PbW0kWK2hYFdRCBC4zTiUa+ft4Mx+nh19d++Np/XqU=;
        b=TRBiwUtnhItKuy5MUaBWGVLRjRNwfj8lLTF4ziILWlWOrQEnN3Z1aRM+f53yAC2ccd
         QWap2cJMkj+mddMiaixHr/+FYu9VgaV+IEDlWdaC5efPvaWU0nSQMpeQ0VuOGaFgfo9r
         nY9QfuTxp8k3zdqG76cKALslxdhPt+9UuUvXzn58oZsAB01o1uX+uvnbr7dv+/HRZ3s3
         YqI7DGTIzNEUjr07senN65ZocpCqRZPWtOyR6pQTizGuw9ftVkBr0PaJ2Lyffxgp/xic
         AQdKTgOcQV3BD1ux97frpLZ/g8bP85w6c0qTwk+Q3Pp7kYKdRQugB71nhdYixTIYdetG
         RbVQ==
X-Gm-Message-State: AFuF++kD78maA8XxIEW+6AQ2Bvi7APiFU30SubOchjKd0f6I7jJjsFKg
	XrjAuxOhznYzFO4rQ+WHoKQ6PV67/xZwsoHkfeXsyJDaWZ6Qr1kbS5/XA9tQCtku/rZUUxkyYtM
	0PYfWF3RCYFT84qIOvNUJhuK517QDDYo=
X-Gm-Gg: AR+sD11RjK+Sl6yuVtxGRHaqQxRuHj6zgd8hX2ioNQriqvqYA/MLQ6i4pNAhWD3TR6s
	ROzMIQynVHMKUqQbPKGY7Tnh4swaSiQyHOnRAwF1g2CcxdpJszt8KmEI68Dn9CMdDgwsYtCdAco
	xH+XyfKCwkTYg8RcqQPhdipB8jwPStke0vlvYyd72rwgfnB0Hu0cc1lOErqP16eorqiCCDlnREe
	u9QIoznh29WMCpwF/U6bQyGbB6IPhqXnT5pCC+n/sE1YSOkBXkwIWhNAFHKzrZoqULyoZR6h/3m
	XA+nsoBzoVsLQVcVp4vCFPnsQdFwuVvfi1dgtlYCh6IRbjESE/m9kt/0mpUxMp+qK6mBgr4SAec
	QgSZNnl7rsP/64zCQFll6HemtHhbXStZ124rUR7PRWssjiO0kJw86g4VBQ7gX
X-Received: by 2002:a17:902:d4c3:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d74df1c3e6mr79183765ad.2.1787936210679; Fri, 28 Aug 2026
 09:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827190431.GA1817346@ax162>
In-Reply-To: <20260827190431.GA1817346@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 18:56:37 +0200
X-Gm-Features: AcwNN1XdgVJz2sbVL9UNhw7YCn59Z59000uRXgELN71Dt05Vgb7qG2OEHAOh4-8
Message-ID: <CANiq72nM+yxePYAD1wM+_Wjhm3E6+TpwXkP6BAK9ZwkuJqkNbQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 9:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 23.1.0 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 23.x
> series is no longer supported.

As usual, tested for a Rust build -- thanks Nathan for these builds!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

By the way, in the table in the LLVM page, it is still has the the -rc3 row=
.

Cheers,
Miguel
