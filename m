Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF630BB97
	for <llvm@lists.linux.dev>; Mon,  3 Nov 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172654; cv=none; b=MZ0aJH7lyZznWbOI9RupR1VFjwfvGyfdLBRi33A3WHv9FUsxlhTZt2E0w3TlPCjWOr3MjChZXrK7liOI0CyDklvT+2fGYc1JTYQfL/M7ATz23AgZ6gDIwRfESQMb7Tis5mJh+PPW7t3jOKDljpqitM9rLm3yLoVxoWK6tmrRyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172654; c=relaxed/simple;
	bh=ORdNUFW2zEJlWs19F6Wve3Y3tfAR17V4MJgrWtqk7Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GW1/AMskPNcajSF+UrHj+9gpqZEEvCjppZFfVtSa6I1Lb3DFTSuoup79KFS+V647TKo3x+gop5bq1uw9ykALy7arqCGjfxIoHQTsR1cilQ0aE8CfPAthkSl2+bLv50xe1GGijhfo8U9DTsUgxKI3Fm9/B1n8w/WaXeDSln5Iixs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOekaELz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOekaELz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3408dd56b15so2257703a91.1
        for <llvm@lists.linux.dev>; Mon, 03 Nov 2025 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762172651; x=1762777451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORdNUFW2zEJlWs19F6Wve3Y3tfAR17V4MJgrWtqk7Qo=;
        b=aOekaELzVE5+2Lk6JHYlGi0KxfXQnOlXjIb8B3bOACClNs4q68PjA0bKg1zpkQ2+hV
         56N1Oofo1lTsS0OYxE8qmKlnn0lLhUY0HKV3utW6k7d3d99RMuNvDaF1H4hlSaW2hky3
         n2hBDwCextS6HUCcG2hMTWufvPoVECKOOjSq2Pg7lTMoFC2tFknimgP9ZhvG+nzgSiWn
         6gwZeDpCYZ4SYopPLqIO5fcv2lOY4LcpYeKUUexL4HFKC4tQ5U1AAsKw1gykGOE8a1lb
         fBFpcDhrI1cm3sQhFigI6ZZBaJSuUWpg13Je6jFAZ1eBEXti7rrRFwW4QQt6RHYej8oj
         xa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172651; x=1762777451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORdNUFW2zEJlWs19F6Wve3Y3tfAR17V4MJgrWtqk7Qo=;
        b=gZ8PSWMgJvApAXhy96WidoGJZSOxNULDOJlpW1nHEkVd1BoV48jOXRM5qbVCgZRlgZ
         uqIufD6Wua/5zJEQHyrln6lnulnUbntpq4ZOUliOtNlt/9X9xk/B5TjVnL8U7jWCJEZI
         73QdzpHakSyXW2AF0MKowo0Wr7crymA4k0r8gEjtmI5Jttc64o1EWBQqrLP7QKrWq/jI
         At4bL92U8dqEQyWZwbDTier8PMcwdlXr46uoQs8pReIgAryWJ2DI8HNmT4hlkfKrTJpe
         Dbz4SAU4PF+E3hHykpveWpquvEmYqDO22i+rTPCFgsey3sHjWewV7snfAp5wyGo56qu/
         n8vw==
X-Forwarded-Encrypted: i=1; AJvYcCUuE10UX6nxWrkjpJboUCa6cUKimpwCU3SGhipfg4ktWYkRC3SSlwwMLa28Pob+onq1tryB@lists.linux.dev
X-Gm-Message-State: AOJu0YzCVaFi5uF/WZ/i7Hg7zVoK7sGzwAxtgKaFPsW22QsgSOQ6Fcpq
	7Z+R9mWIgx4XpiZ476hTaugnSJPYSV/zS4HdLB8eRrOUuTeAse7tmQGX
X-Gm-Gg: ASbGncsDFuBvA2HJJAH0u8i8HW5sU526L7Q1cL59/hLIS5+Ry5dxr3XxpKvSnf8kVsL
	uwtZlVVYdFP7skEZ8t/snX75GflNvlQHEoDeCpI3P5FcR6p1k0M9VGL1HA/bnVS/fdfVKvLtSkH
	/rc3HasKKAO5nV7VP0vFTp4u30bdeHkO16FecF54LVPmglhYi7DnFSpQVDMvWcrpvrxKYaIJ2Lw
	cxrl7qDhfJRVWZ7Uq2UGckh+MtpZcmQ3rsKlhue8HlyljkBE/b8yJ8Wwo5Z32DwfJNh19x1EqSp
	TUCaeHk+5GIn2iTse9CvT8xKDnAjC/ZBw1mf+o/zPTNd+9P/itJSwbOymhVe4ra77HxxinWmuCs
	byMa4n8VrXTZo2V5VoCgIrIIM3QoZo826zRmLA1xeIa+1NK2HUL7um2fhbR/52hKMik/8uFRp9D
	z0ESwldWHXBch+B2aaQK5ZokZN9I/hKcEOt1BZv3e07+1RWhIwELsEHPWEsgx626I=
X-Google-Smtp-Source: AGHT+IESpNdOSIFJ0AvELFe2mn5VOX5nqvF9BWuKg9gD11/Sqoj1Pk/e1iUdylQepkg9PBFjDt6oNg==
X-Received: by 2002:a17:90b:2b48:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-340b5723c4fmr10683210a91.19.1762172651160;
        Mon, 03 Nov 2025 04:24:11 -0800 (PST)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b78f8sm842554a91.20.2025.11.03.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:24:10 -0800 (PST)
From: LiangCheng Wang <zaq14760@gmail.com>
To: nathan@kernel.org
Cc: jani.nikula@linux.intel.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to reduce stack usage
Date: Mon,  3 Nov 2025 20:24:04 +0800
Message-ID: <20251103122406.741-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031203446.GD2486902@ax162>
References: <20251031203446.GD2486902@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nathan, Jani,

Thanks for the detailed explanation.

Understood — if this only happens when CONFIG_KASAN_STACK is enabled
with clang, it doesn’t look like something that needs to be addressed in
the driver itself.

Thanks everyone for helping clarify this!

Best regards,
LiangCheng
