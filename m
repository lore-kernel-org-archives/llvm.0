Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E763451CE
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795382; cv=pass; b=FsYt9kf7mc2C7yDvb4AEVunXonPIzySPApWDpWjXwrLYk7QoVfywW21hWZKLxPlDCgG/IQ2McgJfVulDspa7IWisorzcPB39Z94LhgzHBQ662zLcdEU8h/6euQqxd41PJpmT3vJQwxPJWd6HDx7+KshV0jSicMDZuB1w1Mo8HNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795382; c=relaxed/simple;
	bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDMm/A0xfmcmcUU8QGdKmD4xLo6x8sIwKNTnMSMatFS27gGlTuQIkhA8nhpNei1bKMCcgfysA5qL6bErv4XowicALcmpUUoezlY3eztQ/0YyIvM/q7nUHmiqmeT3ur0RkAY4YiThfpcxCs7MB0UDyGKd8xm4Y2Y0bO1SWj83/kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYmNzdRy; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYmNzdRy"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso628510eec.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 11:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776795380; cv=none;
        d=google.com; s=arc-20240605;
        b=EhjtgdEqPgL0G5q8rfnT2vzNFQiTvj4DsoVx5cblJWvjE7dsVpJWAZv72shTjmBOp8
         tiKBnHndjA0weII4FleimtDtNnUNzvNJg9+Hw4KpptMC6pF+3lXQI0lwgQtNo3rLppfg
         k/TlyzdpmsSP/YSEoBPoz4zwLIgY9yaHPHmXaarfphHbrP0UfQb/9Rz+jnEBk91rj8Fy
         PVOIIoIbih5mO/uILEQMi4P3rofvByfsnjWbgnJOpc7IVof+NNTptel6zsW+/+yLpbvi
         atZtHiGR/1xIcYbzrbOkQ5FGuKH5VRM2uMKuM1ljYNSJ69p2pKXiRZZVzGnyQO22tejI
         U1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        fh=0esMUhbxz0DFGLZKh71WWsd+GSsjFtgVQATvpy/mYE0=;
        b=M4X0hbB9aVHeI30nPeBSExtq1rXHTgO17ku+m4UiYvKsphD6WNR4lyXcJEPH3zxcNy
         McemfvJHPKDJEt2wp3OiJxLjgWGT7dPfL2IOgrgEqI5KksrgEEoVHbOqYthqnkKljs7+
         jhe44gyZxgL+xEQKnNinODaNs+zuH3Be239Ms8P58wfbuq9270aaxPPqPndSKv5gyhKP
         rObmwXMRaLPJPS464OOv+fcZBAoqJR1S/YAmDtSF6phFBmtvg4NFQXaiknk6hCa5+6nz
         ReBqojqwcaknsY7yW9+qlBFikhzp9IYjbgmAasjW/BcOKu8206GAN4F8vKO07uU7Y+OD
         +/fQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795380; x=1777400180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        b=XYmNzdRyl/UBLOeCsi09M/Z+bK5QH3iz3YbOqU5b4obsJSUr5U8XflAmWmLelkbm4a
         JuFioBV8sCotfWeY4O1FWnKpG4HquTjp5lAKPK80L7JwPbrCrGRj+33Wm4Q8PhwSN1+O
         e8GgUXAcIf5kBiEAncPfUFhjw7FyiXTSCaKr8jLfKNDf1eabNq2IbF4ezMtFJ2xPTobt
         q2gMEUaE9AgwDwyU27DHX4KzhWpz78KHP6yvzwoVMBXAEl+kxtVPxYe1Q0n4AVbN3/qx
         TykkFLxtR0nlqyeLIrjfBmgiIj4g7kaYaJDKV7H2gaY1w31GW306lwBiTd0AiElhoch0
         QL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795380; x=1777400180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        b=GveO2MdbS/G7/Y3Iq/gAZY0Y23xCGavdg2HrYYYGk/3esyXAVOsID5Mvh8Az24+Kg+
         g46/vqUIQWv3azQnfDNMVlvMi40RLuT+Pw8lHJ5d68yWG8UEI97s9bGlG1eyhVmXRACj
         Edn/m8E4b8gcXznGEVgGw2f2fPtXsWbi/bPlQvJHjLB499lapBNwS9iDOP8OjMXHmFyY
         AYMLmGiWnFFEL97fVvpZ+rSXmBNfECvoDtmN/7N42/7kYa+9LZQUCgLhYxAt49UT01vA
         tQfW0qt9pwBu+uGR3TKi9H3A6KrhJPD8jKON1IXMrxo6cinfN6A+S7TUm2tqvvVR0VUb
         YX6A==
X-Forwarded-Encrypted: i=1; AFNElJ+ji7Zoj09bICsF/q+aP5zlTAVk0tak+pWh1Z5xXgQwbJpRbLBd1eezYXnqb3OnO2lCaU0F@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+QdPll5WwR4Fd9M6m0NsBo3+mEkrG3CjAbVJQTN7gqDMtI323
	DzUuWTyEfk9fg3AVtFppA2ow3j+iSCMvqKWqD2YblbSIM7RPXLkD2aV+My7E8dnjh/tM7LWS5pb
	4UMGxQ8MLOh8OXMRBzphFz4Xu7EpuQdQ=
X-Gm-Gg: AeBDievagTc3HiKpWBxODh/PLR+KsgVHghMxn535sU0oZ1uOaXGxszzpkrMcBFg5Jy3
	9k9y2hFt062iExLRgJ73Wn4NHOIsA+eFD0Ons9LPogBPS2LqJTdn7/vRJxTDTPMC8aBEKJfvEdA
	DdjyYyvmKUwcH939UVAVfFB8cEJIj/Tp4QqnLm60g7+XNmeF3NIf6bk/qeFJ2AqMEgxC/YnwRFo
	DArWWHuAzobLZIqy08Bqg/AsML+y5PsjU4PRsbYNE1YIV+XryWYg5kPmIIdTbtu6hKvJFWiiGYU
	7ATuW+iiljcoFBbjI7HQG4ix/JcZXf2dwidJapzpmGTkLOCyJfFEb7mdrXK+IFaQInvxyXqChyP
	h3OVJPDyfeUy/IxUbGCxyNrMEt1EWENGCyw==
X-Received: by 2002:a05:693c:414c:20b0:2e5:5bf4:886c with SMTP id
 5a478bee46e88-2e55bf49d87mr2808147eec.5.1776795380309; Tue, 21 Apr 2026
 11:16:20 -0700 (PDT)
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
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net> <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:16:06 +0200
X-Gm-Features: AQROBzC9mHOnbDZIzSWs7JSPScbJTWmOkJB9BCTbBPzo_hv4xsJtqwnMLc9zKx0
Message-ID: <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:47=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> There are some other build errors apart from this on 1.85. So few months
> back in the meeting with LLVM team we concluded that for sometime
> powerpc will be ahead of other archs at 1.95 till others catch up.

In that case you may want to modify `scripts/min-tool-version.sh` in
this series too.

I hope that helps!

Cheers,
Miguel
