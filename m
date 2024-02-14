Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0A1111A0
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873930; cv=none; b=B8A9TzBOc+B34UWG5wlvHfiFraW/tuhlltMBHwPxnMZ2llA5phFVbRhq8s08EcGDHgKuHmNyfx/e/1Sgi5bJMIRJVpcsl22ZLpGqNzW4sprGemCYVRGhf3cIH6DBc9Z2pGZ0AzXXONUpaU+bKmrZj2759umNytphs8HcMbBHGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873930; c=relaxed/simple;
	bh=BxrbZG78mhySk/vs4GuYCVqBb7nK8xSAta5ewnnEwbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdV5aSOD+n3raZlK8DQHrjUmcA5Hs1Fc7CR6573FnCymS7jhef+x9TCcwPDFeKcfhl/EFJrxapDqTOqaKi54qeXlROw+sCXC+zHZN9KIvSqK5kCEPM45P/gQPLjplM10JzxUktDRStP5pJKZgo/gJZVLuFkX4YKD/AnAukt8z1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIzSnWB7; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIzSnWB7"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e2e096e2ccso1425872a34.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 17:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707873927; x=1708478727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sLqoPJITx4zipG5AwnBaabPkeaccv/ydfFvCORtqBw=;
        b=hIzSnWB7hbgqVNCqfo37Jw2NhxoiabuFQ5pGbvcxy32PqoqdfUXI/zvtHYs45bRU5P
         9s7riNOzoyqBc3tnaR8e2IYY3W64XVRKXIeByfb59GI079v2mzcsnjkHHWVl5ZRy8G9e
         sBaNNjkBOO+nCFuHzJENjOCTWaVuVr/iUlEalayIAda+crZclsohtlhEHP843cLNpBpP
         7vOIEZlfsTQrrF3fmMGbRF9oWoI+8sodGSfoRSOx9nxAA0VjncJNhPE84SX8OgzdnQ6B
         pWSRf6hnhASGyanRV63I/fqCpmyOF8TWwze3M/955NrvfSbHRwC52/5+d+yqwYRW2rWl
         PPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873927; x=1708478727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sLqoPJITx4zipG5AwnBaabPkeaccv/ydfFvCORtqBw=;
        b=QRE3/YpCV03lz2NAf9P0Y0o8sGs/xGKXGyrUhwLePI1OJTTaavPLhKeK9bVAb7QxyS
         Z68vmR37nRFbPUIzMAeZHskPAfPQlm8Y9FAM6Ue5+hDygxdySmz7TC4zWqUxttl0qEKB
         JJyGkZSsRAsou+X1EG/qj1VhCoWsUHvD8xO3Ise2+CIsxha0oX5n3azJkm+8zWsYEmng
         8YOzAdXjCznhiwgXdV0+p5pBZ5/9Rpgi1tYMA7RspScMJQqPHa8/8pdsLIA2YenQnrqa
         MyZQqlpMU29i4G9FMPbMPZBodvNbjlBIoO2lnfumBLkd/05wVt/w9OSbdFuzewl3SONr
         aJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUJAxZ9r1Zi+XPIwqzGWi3VEQ+e37aYO5IYeJVj2PSy4O5EpsSTJ/hVOi4EtjyhdC63c/RlJTpSwH4bs8PX8UFZO2JWMA==
X-Gm-Message-State: AOJu0YzIkuO0WTdW3RngzMdtivylzP9g6SbDrfaKyo/DVGWRIWRUmmBd
	VVStr+PozPGdO/LqWf5ct2B3nYLmZMvxkmbKpM03w60lP+ZwRyG+
X-Google-Smtp-Source: AGHT+IEXUKD+kOvDwLyOq7rOMY2ofbBYCXU7nT5An8YIVT6QAm8hMjllt2cNtqjDQzKdUahNpNrc3A==
X-Received: by 2002:a05:6871:1cc:b0:21a:866e:f4da with SMTP id q12-20020a05687101cc00b0021a866ef4damr1083554oad.52.1707873927452;
        Tue, 13 Feb 2024 17:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt+APFGrpGqtlhjkdmd9JNaJcJG0vazdIukIU3wejUWXC3WuA1hG9ZtJfcabqkSj+oKf532xruynpjCatkDlnJZ6C4DHtesLHZx86PQ1jN+j6geuhcxt/qmguqLFrCfqESd0wfUPfqt8+DZbdCi9LMb9RcqgWaHKUAxvrxRa1XqMXpOHsicecimw2smUAyhC+8cXhve07zCNdCkPdKLhjrAme445x0N8Bg5RZSzgpSjyDzCC5McnXkTqQBZYEHc/yIjDKoF8YZoKzvJt5ZLHPUrTXrvcrCCxSWSAZI+Y+1+8XxCY3leiXPaMBjruBROti+KwrSC5UlhhRZRo9iqy3YKc93mbrzTocHo5O+ng6PhA7795V26Y6OG4LlrF4qO9NpnuBC+i8Yxa1Ri2Oz4Qfe5Ao=
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id pc7-20020a0568701ec700b0021a89fff00esm572928oab.19.2024.02.13.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 17:25:27 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: justinstitt@google.com
Cc: andrewjballance@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: [PATCH v3 0/1] gen_compile_commands: fix invalid escape sequence warning
Date: Tue, 13 Feb 2024 19:23:04 -0600
Message-ID: <20240214012439.879134-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this fixes the version in the commit. I did in fact have a vim moment.
this also uses a raw string as sugested.

thanks.

Andrew Ballance (1):
  gen_compile_commands: fix invalid escape sequence warning

 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

