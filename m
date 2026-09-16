Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C744E2F0D
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592557; cv=none; b=u5/WSE80FPkkTsOD6jV8fcVhjEll/VFZbsy/OiLS8oq1he5YMMubUv+H1iuk3ztAbR8wqJuAbNqcIoHoPuScKxTvD+bVRM4nGiNdl8EYAW+prBEsBe/+nm2k51inq5XFR1qp735xa/80DlbiSHQepBNfS+4Jb7A0HfKxdYC7EQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592557; c=relaxed/simple;
	bh=koETFQfjHFNpObPm+a3iwcMgfX+tKG8jegzJvsvQFnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1BSqMIJGsQr9qdaOBBkUmYnq6q0SjppN4soh/aDFzh/bqmhnjhX91H38+6BTUXRV3+gu2eDWNteeyD5+WApurz/cFtoiZFgBgs0tIVXyKNk7BfLfxq2eoRO1eQD9jt4XIuGPjRrBCWWZQUIRp26Cv8WtskkLn5F1ihf7OM5tzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQIcbqdU; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQIcbqdU"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso54919e87.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592546; x=1790197346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qlLYXZqY4ht5qui+jz/p5YTH6iOKiAioS4FKUxhszs=;
        b=aQIcbqdUrU6kRktfy65LHmMhBjEsaKtvjhlk1sk+98nXQTcryWydZ8BbwcYZxyne9B
         qWoez03ADHFj7CUsxVLNDZw5GmBfF0HyZ+0iSthn/NBm51Gv/OS7tHjkaaOce5ybqbFx
         JU83ptCMS5kbxcPYelvkS3B+KbWIBMjgDztUHRytjn+sTioxnRQTNd+1v2wiFJf3phJ6
         zPl5CPd4Lg8o0GAfuCRKeDLiHdH0MjEPRZxL87UUdPTPupHjZCR1Z57zzbi3Vh2Fb5iT
         Nz9iA1y/0EMlfrjlc/PFZG1H5vIafhcDEyxm2PXbDY8O3K5e4n4BNEbQgqgNjQLuVuSh
         tS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592546; x=1790197346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qlLYXZqY4ht5qui+jz/p5YTH6iOKiAioS4FKUxhszs=;
        b=WQ+MLSl4xEurpaXJXTHTQYGLmJb6StmB0ABQL7H2XR0bN7Tsbm1JZ5TQ1Ly/USD1jp
         PqWuXnEwpN6d7dwYtDhpwCeNOCbeTJdVsMmSvx/cs77aaSHyCQ/TonFMIbwlL0WxSyDW
         2e1a/yAaGxsoqGzgmcMrzuF8MpYPPOZp0CnPd7yC/GYp39H51DObY1Z7QQX1oFX6xtsJ
         5BUo88oip6LNePzayusbEMdRS/SjQ+kUS5a+q2djHKPc9QIoM3dJsnxO3ufm/7RjDyqL
         H8b7g2ylTP+6LYinzaf5xwcMMsD7KAVA7wJdZ6HAPrK/skXRVdAtWSf2a3dm/rQ3+43R
         4pjw==
X-Forwarded-Encrypted: i=1; AKwUvBwiZoJxFbR5V/aCqTb4yZ+NxAI6jyhH0afHLYmaPoDXJ5WjLUfShMxwvtf5RJX99ZmHFSdS@lists.linux.dev
X-Gm-Message-State: AFuF++lRfyXZl8a4l10OT8WuRGMCr00QrkGE6bZgU5fgbvGYjOzNL7xT
	9XZRgZTrvMxlJAh4SH9qbRkcmKQCBiI8JiomDbRsKylDREsv8QY7AIDX
X-Gm-Gg: AYBFou1qDBdZpTKmCzITG9uWId4fxkWpOo01IRSTIYhOHwaqTjlQuqMtylcowWtx28O
	TSRMnnjER7agmpGL6JrhdalfFeQWvWpPM83Qy+t9XQKK11cv661Wk3AG6ra6rZ22lZ6Pz8moMh0
	KFI6qigOU1CIaZJsZLVWNlW5Cb8uldFofcPrum1JYY638Kn1FufbCyyqcMe1A02CVgMxU4ThITv
	debCnHBIY2QsfJ8g7XGI+jzIyWadUpn6FkIASJFwP/BtIcXYflOKDZpn74qmDR7sy5wDF5u305a
	VQN7ucLPgWkjamPmlQxKzvU74Gia0/4tok1ih9KaK/gz9y3/Tm6GF3Jbn2i01pCpC5wfxfMmw0k
	aQ6MwpALIATmPHntJEfRROcQgAYZEtw7+sIOAk4jhGtQptaovr3vcARIm+ePjFylcX0t3TWZOSK
	YeN7klFAYK95Yr38PgZ75al+nOonI9UI7SYU6eJaMwvfFnbVAFpIIuMzCzBNxK+Mal2XCJslLY3
	RWBwl4YN1v0VeXIScn7N/cScb8X3atxL9Dt8iQDB32NkTwzA3k0gSNYfY0FNKySFpB1yg==
X-Received: by 2002:a05:6512:2c97:b0:5b6:1a7c:59e7 with SMTP id 2adb3069b0e04-5b8b665ea83mr1028346e87.65.1789592545994;
        Wed, 16 Sep 2026 14:02:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e7f2fsm1175758e87.76.2026.09.16.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:02:24 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Thu, 17 Sep 2026 00:02:23 +0300
Message-ID: <20260916210223.15456-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910033636.3a2ed151@jic23-hlaptop>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4> <20260906094622.433243-1-zoone.rupert@gmail.com> <20260910033636.3a2ed151@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 03:36:36 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Maybe we just set the minimum allowed watermark to something that
> in practice always has a temperature (or almost does)? It's kind
> of true that a watermark below that doesn't work because we end
> up dropping data.

Two temperature entries are prs_rate / tmp_rate pressure entries apart, so
a batch needs one more than that before it is sure of catching one. The
FIFO holds 32, so there is no such watermark once the ratio reaches 32.
That is six of the 64 rate pairs, and one of them is pressure 32 Hz with
temperature 1 Hz, the case that found this, which would want 33.

So I will hold them locally instead, which is what you asked for first. The
drain timer runs at half the fill time, so nothing overflows while the
driver waits, and the hold lasts only until the first temperature of the
session, bounded by the rate ratio at 128 entries. The first push still
waits for that temperature, but only once per enable, and no pressure entry
is dropped. I will re-run the zero output regression against it.

> Validity flag in the data we push to userspace?  That never works because
> we don't have a universal encoding for one.

I meant driver state, not a channel. Moot now.

Rupesh
