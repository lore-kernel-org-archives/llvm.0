Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD71990C7
	for <llvm@lists.linux.dev>; Sun, 17 May 2026 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981575; cv=none; b=oUyj+Ny1hzbeyxmYVsGpnSMf+OUnp6EKbmdK3OnsEcHlqwHfJLFWqwqBSkv2ZlBy4/uxGCdG/q3p3Qj39HaDJ8RpXJCP0bS/Bbqkd9oNO5wYOIjkNcSYl2eunZyrj7QMrMF9Ld5iCRO4eqOmFpczHS/PZSwrBOSfY2uAiunjmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981575; c=relaxed/simple;
	bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VLmNzhzP9SWUgZzWXjquBLQtTgN8hx9ioCFquWAkabEJ0YOV7RhT7avPKwYx0cME1CKvrbMXH0j+yYSD03CNxr6Yg58zVRofZ8OAwYyOMsXy+ByMyRyybnCabZ0j84nZBXH0gvIDy/fWSP2/cLPM2IhzsLZqhG5uwrfbQsy9DKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REDmtFvh; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REDmtFvh"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7c58e6eb3edso5165117b3.2
        for <llvm@lists.linux.dev>; Sat, 16 May 2026 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778981573; x=1779586373; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
        b=REDmtFvh8VjUnzGet2gFqNwP9VADPx2zvJZMWsIpcqD1ABbhRlzc1RzsMkK3HL9WX9
         +wpzbhfnLs/PSjRBHKsJCHV37Qv3H4lJImRK1LKMXY56TPqBPnaSeSa56mZNkGH7+vpk
         DtWn3rM5xQBZzKq3+JyfULtWlYiaVnucgoUmUH83QjMPdE98FpVeE7DMhQRcr+tniYkr
         AgicPdQw08XybUSfYxrVocfnvThT0H5WCBdNcXqtXzjj1Akq67tv7raUYFxwATeHI61E
         v3arst0/CVoZ5bsuWJGzEqAAGrTpfAQTuwwLNP2Hl/msWj8k9WiAz1qCiFRWwM30Me3p
         StPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778981573; x=1779586373;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vM7dpFsn5ov8F0liu1dS7ratbNckjDrhOhCUfYNjLzI=;
        b=HaESPyFESODRJ9fJWdk92XJm17ZuutKZykwR32PT+carOt3ryheOE382g1p5/vUEP4
         OrOBFExncEwiBbjNqolKzbHpWPa7gfUnuYAC+rRaaOBTQqDT6YjOkWLloeDb/wJPn9d7
         v1NqafGSH6a/EAGx3owd0Yky6j8CC4NOZQm5eJrPT693keOANQS0hhQOkhvGlH8+eTEF
         eMf8Um0UmtzOnx49/AJFaeQ7Dwdg+u1oHSmtnQfcCcvXhPqyBHiEo8JpGiJ+tz3ZnIiE
         38iwym9VSRx5NXhXEYSeGWKs2ynk/Vjd5QiMUG5Z6/GmCC19rhrtmW03D+LbvM58btmJ
         JJUA==
X-Forwarded-Encrypted: i=1; AFNElJ9NBnVvP66IoaVoUN4LJXr6EplSqDk7qBO50JazG+vRpbvzfRctw5h+c75iWHVkYBHdhQqr@lists.linux.dev
X-Gm-Message-State: AOJu0YzVACp1jpp8bNPP+k0zgecRRJ7iRlHQZP/sDS2xEgIB1aUN7hJf
	GqQHg2Qisx4YbxH4YtmfSN4j8sw0yAbH+9p1ma5cmvPq35Lo+IBSSdf1
X-Gm-Gg: Acq92OGjKDCf7xtHBt1YUmjjUb/zDVIHU34eLcitNSslaIptHExoqgerFutQeeCH69T
	8Zp44zWAAlDIfbUMpML+V0g5RapPnLgeUn8HsEiEPQPJId0FlJV96y74iP+SlNm2A+I4i4hhEWL
	aNRlep32B4MQb4k1/9T7s/oj5XAVlqgZuippxsqxeFb3Ubl98wQoa7YfxCW7wxBqNHLwe8Q7x/n
	BACFqXB8CjF5Vmt/r1aNKmOWTXrNTHDXx4iPexrQCH/RWnTBaSFHZHpzOYikOBCF6nG+e0lZtoz
	37j3ebq4ijoqK/kdilF9p3VVVkbwH0+vA143TEz/b/ZKgQUVgvfNknT94Ux3LkwfmRoijBXU4Y/
	5Iqw8W4NQ5bU8cPhJnIaE+4Ty0nyoJbAvsNmU7SpPImq79xfWuXcObMJLIxbjrsSfP/ZvhKCM/m
	f/GwCjchEuaUbV5wu8F/rKuPstKIb6fcc5zq7AAbKBGTK5iNuZp5QRYPRCTlaBfugRZ6imEBFvY
	1+MeO4VlvrB2qdrVA==
X-Received: by 2002:a05:690c:f09:b0:79a:b9cc:2100 with SMTP id 00721157ae682-7c95c00dc67mr115014067b3.35.1778981572872;
        Sat, 16 May 2026 18:32:52 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9bc0dab3sm2342547b3.24.2026.05.16.18.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 18:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 18:32:51 -0700
Message-Id: <DIKKC3RENM6O.24MCCPOVFAVZ6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v11 00/11] selftests/bpf: Tolerate partial
 builds across kernel configs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Alexei
 Starovoitov" <ast@kernel.org>
X-Mailer: aerc
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
 <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>
In-Reply-To: <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>

On Fri May 15, 2026 at 5:15 AM PDT, Ricardo B. Marli=C3=A8re wrote:
> Hi Alexei,
>
> Just a gentle ping, please let me know if there's anything else that coul=
d
> be done in order to move this one forward. I believe everything has been
> addressed.

Conceptually the series make sense, but I'm not a makefile expert, so
waiting for human to review them.

