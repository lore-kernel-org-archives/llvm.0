Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D04435B63F
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 05:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745214; cv=none; b=UYA+XPZnmcb6DNb9aaUhNKfm7oMtqPq/8TsDRpJeZVOFFKcU0aaRugnpFib4Zz5TlM4ka8/y/prZ5NpRXhT3J5pScNmuQ5J8ScFcDdPYSt0EMcXjZUPDmPPRb25EseKMOFdRg5f7jKgWyFnU0YtVKJApEGSeGfPtKOJc86Qia/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745214; c=relaxed/simple;
	bh=MypcxZlDJd+r7SofOnuSEe+Q+SDR8+gy+W2gDGm+htI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWV4Um1pYpHQmi4IPn8qVfRyGJd6/YVOhf61Yhj2nzEhjHlWmq9xzfkX1fY6fhMwH2h9WUogx7Z7w8v2luwVERfz2kgBmoSycw9XSX8N1O5HTH4AU9YNQeP0i4DKGT5p/HzsPBYDElxMKgYJ2wuw0n2L2MQNWpaiV11SY7cGePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5p/UWIA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5p/UWIA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435ae9ca4so549909f8f.3
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790745211; x=1791350011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c4qh3TxeW41f6Urn6eqBomxhi1RyxqZL+PP0oFbtfA=;
        b=I5p/UWIAxtEj/4OmcE3nU0oq5yzk/TMw9211f9Ki2bls0af119UnFVko6heKD/A1dW
         +ca1KNOrNfDre+KBSdIA/jQjDU2uZUf6O9Otgr9hEVPR59luXYMJ7kjNtcXh9ep/xqxq
         mGkxWGlGhjbEEHfhIjnqpt1gTqGmd7VLZUi8oko1tdD6DCF2kakuaMX9082Xy9iDwJKo
         d0k0MXw5AJxHZea346205dnw3j/svehiK0/AVVZ13y9rUnJclq4yJFfn6mdAZI+e+ufM
         Cg1xEs3doVP3UpznowFcIfJJVuDxoNViKOe5yA5cCpTHKEkBzz5sFoCMvH7l09Do8N2Q
         mPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790745211; x=1791350011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c4qh3TxeW41f6Urn6eqBomxhi1RyxqZL+PP0oFbtfA=;
        b=b04ngr0K0jmBYmhaFVHrhlWxO8RONWumtZEYonFEP4rRvGTm49b4Eb0AZ5RjRuCgeU
         se/lWtE/uYRJ/lPTzLRSQqiDf+7kIluB94GUYLIj/ojh4HVaTIbDsBeWguCrxppSbaG3
         kpcS7ngNeYwaXb+xCjgBirINLOEwOkc3GTMLGxAHwf0Ewp6MkL0DxLCr5aqLksgMiAAC
         RnEDL6Y0UGmGfRppez5EmjSUd+7yPC53KnIAn9pNb5i7hN9nXKj2HHu1efx3lPlJ8wBs
         kTYm/JwPhK79hmy/ike5otVtHpk8n9615bSv4SFnGSfPtIma0wwBtOHbBIXK17pP1E81
         Mutg==
X-Forwarded-Encrypted: i=1; AKwUvBx8EY3Mb+kiCUhN+VCAQxFVNk9COpw39UYwVxKMw0MiKl+RY4fDCUuQIywkAJCXNZsR9MxO@lists.linux.dev
X-Gm-Message-State: AFuF++nX0+oJ1UM27BxTzt5hz72Ta3hpJNTLG4j6G6wDx9ZaCDpYGcMt
	/oPOI22QNTlARXsttpM30glPf8r9lHQ6ERN5yMmnwaWFiucS3c6o8OnB
X-Gm-Gg: AYBFou3nAo/AepwvLwd0Nce5wMLFQDCR7Xga4J9PLkUpNc4fRA+nR4JDrtf18a4jGTa
	/Mmil+4s/ON9lenpmhky8YgXNV7s9rjLdBXIKPVwuavQihM+Lm2giJOV1a6P0x8DjsZEzkz6neF
	eQ5LLfaZUwYCr0ICbtk9lPiqZX1ub1BponOV56/XteSEMahTxGTXcAN1Yt7gyUsz53hZAtbFqti
	z0a6Py4MKZbAHIMa1I/nFXCBoyyNQ4NfxEahcthsQ/S6u0vpvCsN3fzzdjMyHf4IEHhEKc6/ueu
	sH95khMfKW+HnZfJFqBacowKNhzerNg33nNm5X8H4ow9Gcvoywym69dRZFPJ6Zk+QXSBW+deKVA
	gpVYq1F/s2y0raVFwBQzz6icKovkXhi6enyoBCLWudoQmz1RLQsYpFn+swGRmEmVixG6NnHYTf1
	kDzdELPkC1EPvZiGlrvNIqKm6LHV5plzXrIa1ympErJ0Foewcjl8GFP3n9r5p7ZxIB7mOULaAnE
	OnYGxbMwFcqx+7BjKMm
X-Received: by 2002:a05:600d:82e5:b0:4a0:1a3:bf6 with SMTP id 5b1f17b1804b1-4a01ab4f1abmr2284165e9.0.1790745211216;
        Tue, 29 Sep 2026 22:13:31 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d8738sm36542285e9.2.2026.09.29.22.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:13:30 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: KPrateek.Nayak@amd.com,
	Vishal.Badole@amd.com,
	justinstitt@google.com,
	kayracizmeci@gmail.com,
	klaus.kusche@computerix.info,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mario.limonciello@amd.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	platform-driver-x86@vger.kernel.org,
	ricardo.neri@intel.com,
	stable@vger.kernel.org,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: Re: [PATCH] sched/cache: Honor asym packing over cache aware scheduling on hybrid system 
Date: Wed, 30 Sep 2026 08:13:27 +0300
Message-ID: <20260930051327.206529-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7790ab6c5da3aeac42f6878f0a167c6cddebb354.camel@linux.intel.com>
References: <7790ab6c5da3aeac42f6878f0a167c6cddebb354.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Are you saying that we should update the first chunk to add an env->idle check
> to match the asym_packing migration pre-requisite? Like below?

> @@ -10847,6 +10849,10 @@ static enum llc_mig can_migrate_llc_task(struct lb_env *env,
>  	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
>  		return mig_unrestricted;
 
> +	/* Prioritize asym packing over cache awareness */
> +	if (env->idle && sched_asym(env->sd, dst_cpu, src_cpu))
> +		return mig_unrestricted;
> +  

> I think this is a valid point.

Yeah. :>.

Thaks,
Kayra

> Tim

