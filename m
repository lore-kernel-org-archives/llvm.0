Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446404;
	b=NxFhPNCodMijX9kmzstBJAYeuNoolBumhcWn+4ROdy3GHhbrPuHC8EeCS/Ikire1LoOd
	 1s4CC+PIETHvsmkvd2UzqXApyZrkNAMR3WCpd7n1Ub1loIOrEUCS2z5Tsn7v/j5VYd4W+
	 V3TD/Cw5rPmsPSnkk2W++BTQvJQ1TsYuJTC8JVQnU82tQOGdRiqVQp+6UqNyh843cEvHU
	 b/V/tnkU8rThzEZ6HI8oXBffnclKYgX7Fqfr9NIJCps563BwxzgF3zXjoLH9Rk5KabanP
	 SJlBrlPokAlth+ZdaIYh2tPehWYpsm0mxU2hIVhjO0evU3jPgLr8+LpDwA3QQT0v19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
	b=A/dbeUV7LUep5JhuKMWJhM1XAqThHisza9rKaATJvnb4NPzs3Z0jNlGA8DJ2cMrYoNb+
	 JTIbSL31mSxXlcC/FVs+9hdagZUurYbMQ4ZBILd7m/ynGaeJm9WoKOFUFCCxpbIdbneou
	 eWFJYMBLq1CxrgOoCQ95JJtqyKH0PAvb5n47ACr6IJAC1GabYMew/Ok7AwExdhfYcIzTr
	 zqVb9tkUxcv74o0wwFvMLPmTxB1KQwO0DoPKYHYPYOeGzla8T7/djlheuPHdiGyKcQAnQ
	 j53A+1WYRyFrycbQchsGMYAMfU2KUyQPYHvgNYWjymGHiZmLPTc8gYxtTugUBkwr1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w5/AcN8s";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAD606A31F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BAD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5/AcN8s
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso41819665e9.1
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446403; x=1796051203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=w5/AcN8sO393GQDbX7LsfYf3MxZOds3Do85JrwKOtcHxkdC9G1cE60014w055twgIn
         hOYzRNmjt46WA440KNmXIEPCYrDSfBljRU54xX6Cd4f2+Xsv5ucwGp5Ak/QE+IS5pOn3
         j02Ll9+R2yztL1mSZcF6bVlG7SOUr0MwVGse2shyr4HJLKrCSpS02anzc4c7jaiWi4Dc
         OslbMobdiZo0XAMt9EvqaSfpYGN9Ni3KFxZfU1tsbTLf42p3ezf7IQwndI4UuZG6xCpX
         XUJYYN+Ok1t1lO23/TqeUmrERy2LsmOkg32qnyMcIorpvZ9RrgE2/KnxyalqLBS33We7
         o/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446403; x=1796051203;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=FqKy3Qe+5A/8Gb2zn4ov02Ru6PEDxbEpbJvOKNQyn3LZMnc2RiOfLzeIqbNz0MuipB
         WT/dgXJsrfy1NFxQ5svWShyC3rX7KBJ5Zls6pQxdRq8aBdqkfQKqJQWNXoecpOO+k5H9
         cL3Muk6uC9HSAzAK4GxqtVqIKdrUEz3RS18uuRL8w3JYpn6s9lU7qfAYzdYmI4pD5qcv
         5Rq0CGHhy8/L+YUMlynXQtZvK+HNXdB68xGw3RexR/wRXadmBuTmc9bodh5bKZCNikY/
         Kuew1FHHmKw6dXvTRH07mOoJbvTLyBav8cTyT3kE+bi5vIgWNRWq0oLiZ8PmzymyaCCG
         rtYg==
X-Forwarded-Encrypted: i=1; AL+hErElSMd4hU5licg2kzmiBlkCHQeC14Namlrx98OKNHPZ3UKBU+FG6Xzf5yw+vS4Si0UvFxCz@lists.linux.dev
X-Gm-Message-State: APuU4Z+miYjpi3opdF8vaQMMVFhTlYKa/N9R53DWXiUSIVmiVJcvlCOi
	PbZf+7sqHdwQWAoo8lI5ppO1UqCK7VLkIgvtGyy4Fgm2rV4DC6tsnCXi
X-Gm-Gg: AZFdTZf2K+faFWKGyT/bUDO2Diy4ChKz1Y7vdf/AWsDZmoW1eSQvY2fuGvS+LfGxS4M
	imoPqFc3+POWI5Z+bWPKbHtvjcMR2WHZe8iBfmCTpd99Ua25JEkLRfobIPgR8XLDb+qmAZFIRXz
	HwB4qOhw1Fh44o+IxJDKEQ63X/Mke1tkimOPPqdZ1XfH6ZndXbXArj14/ccLQMt/lD9gy7uGzOY
	RF3pws7mgyxAD9sTd5tBWJojY5W9Oya4Ngtdy2Ipd2dBvsnavrG1VNvQmYPH2x5zNIAIHc0e3YY
	UnRDm+hdwmLBtIBD0G3wpUg3JSFgFEBKXsuNqyy+ApOF1W9gOW1ZblyHafo1adWKKKv2+VXySe6
	paIRoFYO+IQhSuOflWYCw7fKeksjqR7GgQ7nY0Wayk4xhxrBAaVVOWB0qrEOo9d/Q95jP7VHHol
	YFKo0jn5fJG2Oy1DgHyLzjxRXqPGNcQSA0/Bvr7UNi4Eq4bo5fIMY+/Y87ub43FflvgCiQISvz9
	+oysHWSc8b42DG2zQjEvD+nJd4Jx2rxm/PLMMj+i4o44EnMbPv8R/nrzw3qAqsVYmonEJMFpNRu
	Sirno0bwsEi8jBegrwcCtBR447MYxXiUDg==
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr248093335e9.35.1795446402877;
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22848177f8f.51.2026.11.23.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Mon, 23 Nov 2026 16:06:14 +0100
Message-ID: <awRWEiYaktJcbFfU@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com> <awRQxKxzVyw10pFr@ArchOarora> <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> Can I keep your R-by with this change?

Yes, please.
 
