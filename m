Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C547C0F2
	for <llvm@lists.linux.dev>; Thu,  1 Oct 2026 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853940; cv=none; b=UAruZRuVW6x5nDrYbjJLRz+9h+La/AyoPwRFnRSmrcptv3iMGPVwiNsyK9LDMSnPXWwcFWlErSwLFQtPxzUAudffOV1/oFjCwPL4btjz6co2t0yncHOSN0/mJq9RZ0PMGKZYIvW8ppBZ+BBTuOTm7dDwL6pkWfR30Oh/1IL3O1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853940; c=relaxed/simple;
	bh=XXJE9lpazIypG2rFZXwci5NBfeM4Y59+X+ByKH1vibk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0dudZ7ZoAOjC2IjKmoZg8Lu9qtIrMATTRCw1TNYrhXfYfKDQSgIZdNY8nETjvHL49h93OxIW0gnob1438RfLOnwkQgKaaAg+5uol+5HiLqj8UIL7605Y5HfGCJRrK56qPDnKvKHz23cogTOAp0iS51UdZzVAZY5bvB3uEjh5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4SOn/FO; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4SOn/FO"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7847d8aadso5839061fa.2
        for <llvm@lists.linux.dev>; Thu, 01 Oct 2026 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853936; x=1791458736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=c4SOn/FO/wdw0zSd7TllXBDAAYrWhU9O+oCcr3JyBmRmJfSmTGgbHLjTh1AVZfouF8
         Q2hWgNYeZro1rd4Yznftx0ioCgArrA7NF+s5EaDwT3WUR+60TJMSG0VonOLesKooXYF4
         NtGswd1Msr/V4JGLQSXzlcA7UpJ6nbI0g81DGgwUb1bYyC6/KyL1cY0exCpu7qFkHsFU
         133jR8Y606uHdlbR589I6ptpP4ZUOtlXfRHbU4lzCU9q6VFFzWm5UETZkqrvuFwdM/Uw
         /weOj/kfQdqszh6RHmVrEXl8W5RKZuYptjlN1sYMfbDd6ODX9A9pH7hoX/IqtqWAvJRs
         EtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853936; x=1791458736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=uiHd+CUqJaX2SWcO0eOX662stAV+urvx1Fkn7fbdYabPo25j2KJGuDxCAOTJ/xUeLl
         6luNoMuzwDz0av65wRtPGiTJZ/Br/UVeckw4hI7RLBY5vb2PGD9EzpjxTtwWHyf6aMkI
         ymmJkSuHIGPkLqO0hsymeS5Qw/sKpbBGyjihAtcJ2Gp+v+F0FxXjR3GiTLM8xciS8io8
         OWnJwHKyPwFf23rKnXUupXeUp63xyOm5Da570VrTtcjnE/VtZnhRIf2C+PDSh+tc17dm
         FCWDyzxyE+GCVJF9mvlF0Ydek4pO2J0yeM2PjcCn0pmGkDflXoho0oQyp2wK+DV9bZaH
         QHSw==
X-Forwarded-Encrypted: i=1; AKwUvBwnO9QuSdXktwBOBguLpodSoCG+2fqif85aBohMu/wgxHJ7SZRtRGC4u0ttoEIHLUMHEn2a@lists.linux.dev
X-Gm-Message-State: AFq9FYJzBfG0+j8D6KH+kzS810FZeuz+VsmJc8FXFlJOb7V48Xstiiqp
	je0Cn4VmtaDknsHMEA9bv3566OfxrGOT05S9pSUoU9pqKH0z44447Z1V
X-Gm-Gg: AYBFou3tzHAf9qS+/ZegF4hYyxr4OWl05mf4iy/2HSHVqHu+OKhGlsBTtkZed+yQt/2
	r4i0JIzOG5ejE6RiTIJarQTfC/hWqM2ghZzluO9pPXg8Ay+Gy3DEnlyf+UfO3Zj+Uh4MjsfFpVQ
	7UuRDp17Rl5z+Bbe47UzjUD82GVlS0wyC++sS/56XjE31zegy9+p4HpQ22MF4/3xdIl+1P9nvcZ
	6bryK95SPvMbJTI8OL8uf+7d5nQtr7UCzy54e6cgxeMpRDpyKtvHy5sEC7hP58Nzz1BtO8DgNZV
	b4e4Eih598AH5h5/0eCRfzJ14jqD7guazsZ2LqU0/LdAsnXlQdPkhOYxW4lAq4v/OtNbOLSFaXG
	yCezj8fIyfo5wV8Q1E/urZ1rZ6Robn1e6rA6XNN+gKfapt8lgF9Q5Eik/M3dx8ba8JNFRDvb0gp
	JewbIxdtSCwrp5dOpozCYcQoaofcIlX9VnEhZthyEUYmSE1RK8JxzOv/ULF83ktGpV7Xvvf+LUI
	YEd5rh1wvXUeUpK94XiEDWrfaSuajlqBTwbWM1urhDqIdtIyGAkdzopinBI0oIi+jBMPg==
X-Received: by 2002:a2e:b814:0:b0:3a7:6f09:76c8 with SMTP id 38308e7fff4ca-3a779251d2amr9219071fa.24.1790853936130;
        Thu, 01 Oct 2026 04:25:36 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717bd2a0sm14889991fa.8.2026.10.01.04.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:25:35 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 1/4] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Thu,  1 Oct 2026 14:25:30 +0300
Message-ID: <20261001112530.14594-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arzl4DK8vhP0g8Hg@ashevche-desk.local>
References: <20260930100158.957977-1-zoone.rupert@gmail.com> <20260930100158.957977-2-zoone.rupert@gmail.com> <arzl4DK8vhP0g8Hg@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 30, 2026 at 01:35:12PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 01:01:55PM +0300, Rupesh Majhi wrote:

...

> > +	rc = devm_add_action_or_reset(dev, dps310_cancel_fifo_work, data);
>
> Are you sure it's in the correct location?

Yes, it has to run before the buffer is freed, since the work pushes
into it. devm_delayed_work_autocancel() goes here in v11.

Rupesh
