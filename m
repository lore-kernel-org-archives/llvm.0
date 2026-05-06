Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C32D8376
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083891; cv=pass; b=Ds65IU8cx871721acFCwZX43RDs+N5gOYjN6GSoT789wFEmF9eFflI3VGUAAvGn47Pc89jatxovopFiToPrYuAQHlVatsAZl+YU6B20cJzXyaVGHO/HKJwLzMW7zo95QZP/d+n7Cw4hBL72avnrgO6mR4VU8nOUntIeK/dfsEQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083891; c=relaxed/simple;
	bh=jrQj1ieHwXAvI9nV/LU9pUquBLQlX4N2Fdf5TCcxnY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4dG42qhOj2A9bPGADR/pps6aU6CrcpLoItDT7Bwrh7Q96qrQ9o3RJZ2lmyaVa2Ika4KAVTOe7gpsnJL2kkq2G2wcVxcte9lOuxgckqSs5P6x83MX8FaAgo0ueYgYj/vS58wI6G6Zxs/gyGh343oi5GWuqs+TVsKrHUIBSt7eFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCjUsziC; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCjUsziC"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c1161232dso496090c88.1
        for <llvm@lists.linux.dev>; Wed, 06 May 2026 09:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778083879; cv=none;
        d=google.com; s=arc-20240605;
        b=ccjQToGdOGN3KpJaoHiWqdWrJ7PdQogjDxYOSrHy1gsxGCAY2RmstI9matxCsqp7dS
         tPFNzsBdRCEug/ctvhQDU4hlQHzm0mryoXzYIEM3ypyhRkNcWnhko01Remj4H9xGLmzc
         Fr7WkaErQWPAGSHyXm/Fi4tC8LpOpteg+4MPa3W033nWK59RYq9o1SzAjHEuu5gv6igX
         QY9H37AQbCUNVruQ0dGs4130CQngCxOm3ooJ00WG0d7exvBp74YZbl8uDmrX42Trxefi
         nZYgXNyVFWYKug1DyLbywkn9ZwYhkPlPQY65SGaf0yjSISrPmPy+oiougI5sn/XQFRSD
         Lxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrQj1ieHwXAvI9nV/LU9pUquBLQlX4N2Fdf5TCcxnY4=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=PlRn/3fTmBc0ptWDTZ40PlFuSu6RwlmfwLTg2u+8gkdGVu/GDtMSXs7ZgIx+wq/hH/
         JDBYdHSipvjw4sDnFgiptW/ux2pmvXDdSRuYr1LEyTyMShQxlwOD803sSUccXylInaZy
         8iSVrnDBlAZmH5ReurLwmMy6k8ejkx56XJ6Yr51vrksQfZH9BJtM3iRiFtXW9rfx5pq8
         H3GLK9GpH6CeP7tkl1Jhci6Ejz26Z+8TayjBx9J5PTq6HLRlt5GReHKOLEFAITvTkirj
         s1kCtNQAh526NHZcM16tcaLoUxqsT+jX9Fe2wIwOxsDAZq0KoJfWciT22DOdE1f4+E3Q
         vTog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083879; x=1778688679; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrQj1ieHwXAvI9nV/LU9pUquBLQlX4N2Fdf5TCcxnY4=;
        b=CCjUsziC8nFgEPn5UD479pB9Kubz1a3EJ4gilyVa0o1ILw8+gt87xmG+ZCB5SQCSKo
         1APZqpeiAhQLS5OXHc4cq0G/0KPtTOCPSY6bpGlYOirebuvxMwS/BZmvphzprFhXodfo
         cLXNJe99dUu/kAUry3dZrN+t0CzIaVQTskKGZieQH4k5loZpq5N7yKR7m3/q4l/ZC/hu
         0cWSLazQpxJ+OgOpkHpo6Il3M7xoTaStUfrnu8OfS1am6UqWutBvuF3BZ7IWHl0NTNC6
         HKQHegQNJBrdezZXiUiFP0FJClK5fxqi1YaGneoGlrJtlSwGcYxd/wRXZNoXnhAGYcdh
         AI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083879; x=1778688679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrQj1ieHwXAvI9nV/LU9pUquBLQlX4N2Fdf5TCcxnY4=;
        b=RXEXnnNaIFKryvn4X2w1rPXiaHlNS/gHoU0v841bZogzi1jV7ljWMjwzWKBeEenu5y
         z8UdJ9mDY/tvVZZce0WLzzfwgz12TQlpL4Jd7PnHuUFKk9adjZdYnxHBwAq2/h3M18Ht
         C6MnXffre4pYymU+YAPJxja6g8RY19D9DVsHO69wD/FTohxlgMx4DxzWwfzF7ixPiol+
         pJIT4nHjtuv2TabJ00l2QwPazV1WDf5k6zDAzTpAz0xaJnNS3uvIiKhXN391n1wP85a2
         wclVFa34nbijAlCL+Da5z6Pw/LBdsuP7kFZRELIpqy3RX+0wvj+AO6e09W29RIhUmyCx
         fkUg==
X-Gm-Message-State: AOJu0YyaZoKNtOJcXyRcMuCfJnktsTtFDX9R20bWQ0HH73xNqmYkModZ
	4v+C7NO4MJubFZ8slwCycu9wz7q550JHWES4059VRUrbcn4992vEPnSWMmsy4pCmqRr4wg9Eiq5
	qCqPu3HDISelbR/Dxjn24msv8AdAxJnI=
X-Gm-Gg: AeBDievfItziaRk3u7eOpUCavme7H4BQxfm6185tddhBkpiMJ3odoM7HHdLSGc3N5Yo
	HKVw9Alu+S3kqpH6n0e5LApkNQXuVo9wbhvULBKGpCawWRqRCqRLVqiI8KBtTBw5Z/zIfjRe76b
	9ofV8vT6+zAOgFdAUlrcjRk8GtxaJyDK9asFv0FrmmPk5S2yzi1/3fhQ7xQy+k4nFhyGbDYJvgs
	Kv2XsItyKBL5OuMpa5zAb0C8Fk2jzYy5Nm3FLlUz5wSGZSya09b7apG60ny/v+RMxyoHOdmkQ0X
	gV+MlqjfmN4XYvUXcFce6w1v4byuNEDGgZPtfwMIdUK/QOghXRLyxA+WXotSEHmPVH6ryhApuuA
	/HZpk+zmV5PhkZJZt7w1bKtVaKv2j/lfBHQ==
X-Received: by 2002:a05:7300:ef83:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-2f56ae3c59fmr834950eec.6.1778083879115; Wed, 06 May 2026
 09:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506064051.GA324058@ax162>
In-Reply-To: <20260506064051.GA324058@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 6 May 2026 18:11:06 +0200
X-Gm-Features: AVHnY4JLuPm0_XEM9Ptho6PQmbrdGnxCu1Ce2g7Q6oE4bTsf9GZvCS6mQRDPUPw
Message-ID: <CANiq72=3j2GQAN+4mOGfP1DMBPgspYTd+AmQT12pm+3aMQcxpg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 22.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, tested with Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for these!

Cheers,
Miguel
