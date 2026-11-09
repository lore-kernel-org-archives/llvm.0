Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258989;
	b=1Kq/0I7rjIncZyNJ6wuLFQS1g8kEz5xPFE5IvkLq8FosIlLPatARcGmoqI3B2blHLnXz
	 NvrwiUt0ILMMl8quqnAnb+mBpUl3Ic9kGrjNGsL+IZt3XZRIFbjZcPxcqQbadiYzaCnqB
	 RJC45x6V6hLWVCNy/h3oXOfmHVEXZapxdWTNTmM3TigbRGy5x2L6zkxONJMjGqtPFTZRl
	 wtJoxPa+bWhf6KY7/pDtt4s0jK2NCqw2BnwNBbWOL+hFj+rNJiHIl4RlrLjviV73rdcxf
	 HQglFeuEKeKHPbh6/VMjui3IHZ7+YbQEjxKIT+0FbQ6pWMVrOi/u6I8cxcSBuitsUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
	b=DJue+PPXbXakaGlYApAGfI4YDnSB73u0CGsJh35mLMbNa5xu5AR5okt3VXtL/VX29fgA
	 HG3v0r133hhx700ZFThTk0qMxlb+ueBPabYBy5gnjjUY9C6UylNNJGgEXwxnfV8mB+b9r
	 dTsXPWtz6i89yHrPzrw2gLD+Pc47ahFrR5plLFKHXDI+mqxluJN8E4qCk9XAQGM2oi2jJ
	 nVSE3dmXzpTcTcQO2MZmsurB62ciOs6tF3EVUJ7HC2te3x97QOKuB1/GEOzdNVPTcwuVt
	 U+36s4eO/77nFMIwYoejqxjmnOHZgfO8XwnxVew9U2So9Bp9n/j3TGjJyYc2zsQHAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqZ3XyJk;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95568606A325
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 21:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95568606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqZ3XyJk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso9879095e9.1
        for <llvm@lists.linux.dev>; Mon, 09 Nov 2026 13:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794258988; x=1794863788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=XqZ3XyJkIVNmp6F0wF8C5qdLAS7BXdWLSYlW5s0gB08515daU9B0dppQfXcmpcBVqv
         y1Sn7kRP7X8cGJ707vZpx67WUPLWbqfeX5nU+knv+oOYyp8NjHLqs9FsdiI/6FGJ2EeV
         j1o78cklldrTEL+MJd0j0uu+wpY2pFAcURZPNweG4tiwQ/2pzRa3nPr1YRZWo9/oPKg8
         miRHR/T31bHuk6bv+b5kNyOnmTXwnCHgLzDFRpv0SzSkagR2MtCl0go1j/CuSUtBo0bm
         N8BgTvyocbSpZj2utUF8uqRUV3Ju/mC0W/1tx0z4apBeeBjWrQ6AjpIAfBHj4hGsEy22
         7okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258988; x=1794863788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=JT1eriHrD+uJL8EG0e8aW4KRF6rTFQQGM6UR6CqljjjAfOc5CHJnxR2tdIbJuDOfis
         MwpTCU1N/7M43nzXoHv7CO9Dvyb/BeycPhjy55+YwsHy/jv9VJn9rejJvzG9nUMAKccu
         emF5eDPd7wli9VtoLE0EfiSt57Y5o7b3QadphGR3BH+87zsPm0RsWP/zt68lm70Vv0J5
         USoJ/UrVbmWO3RZt4Yp/xDy8PXrRcjXYOkzVbGc4hq6ZiVADSZv8BJ33ldafhiy432xp
         +F2gfHQL6oPRUpq05ST1GpKoL2uXzMuMJf/K5KcoEf2Zi8x9wrecwSCXWfFx0mjvpveV
         VA+Q==
X-Forwarded-Encrypted: i=1; AL+hErEzRmCza5Az5dKZyeVYeBZjOds+T9FOA2B9AOZcJVf1sQ6qjKnoM9UE3TugIij/H0CL5FPP@lists.linux.dev
X-Gm-Message-State: APuU4Z9s2lzIpmbKPHZlsgAKoBsfuouJkq6xWGTlGjYIEvSaeA6p0FKG
	u/hN54oXcHY96w8e65FmlKuHIYPxChrajSNh7gsh9SsqLpTZqxpdUN6w
X-Gm-Gg: AYBFou0UBDxNqXHzIjb/rpnam5kjwcpd8ddjTqhA/cpua8xvRQzIWruml0PQ8gHxfwC
	d5LfWVboTwpAdqbbVaO+5fTy3UxaR0x6m38ZGYcUhLT3+oN9afd69s47y0e2WxaoxAIS6u1CbOt
	jpo1N6ik8Wd6+cO0h9D3SDJAqCpCobwMaJkZ2vxzqRgLEARGNqcY2JC6STKvFuE4YOyOZKHfm7W
	sO+PSizwAKR2YPPheXLLkdQIejI5STmMVTclAe8Clh6Q+n+XmL1PQ/eQpP5js5j4yApEsryW0Vs
	PayQCRfGm10ZYF/Vh3Jqi183JOoMsxf5ljrxHJTZzWV1F6orymKUwhULGQ80Bit3D3qCUDZf5hk
	oQwLcF848XIdGqTqpS0U2XjJOYCylPwwQEMGv8p4cACWm9I3nwVR5TFmnviwiwVsrHTIi5tO+nd
	snjAlLJVNyNlKbG2cQmdpFmEIrkfVT29ArlQ4eSf+443Fz758g/H01b+Qco8k6FeSsKc5tNCYwX
	nIRMsFjQMYxfYcsfEN+eAcPNTnDB7PDGKsIGjLMJKoVXZtaK74yibA5Dve13j8XvOXe30bM3wiv
	N2LnVYXOmeyJLlRe4Yb9dJqfH0yNJiLku9plWRTMOUUi483La6k+G7LQ/SbT6I/fvDje4vS/KHw
	NuWsnAvkVUw+Me9FPj5bHYxKRJ31K6ZQN4l+QRfz2IOll
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr7663955e9.22.1794258987873;
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
Received: from PC-DE-MARCUS (host-149-154-244-77.dynamic.voo.be. [149.154.244.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm17550795e9.4.2026.11.09.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
From: Marcus <baronmarcus2005@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] run-clang-tools: Resolve the compilation database before changing directory
Date: Mon,  9 Nov 2026 22:16:18 +0100
Message-ID: <20261109211618.1496-1-baronmarcus2005@gmail.com>
X-Mailer: git-send-email 2.51.2.windows.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script reads the compilation database relative to its working
directory, but passes the same path to clang-tidy after switching to each
entry's directory. When the database is outside the build directory, a
relative path can therefore point to a nonexistent location. clang-tidy
then runs without the recorded compilation flags or finds an unrelated
database in a parent directory.

For example, invoking the script with database/compile_commands.json from
the parent of database/ and build/ fails to load the database when its
entries use build/ as their directory.

After reading the JSON file, resolve its containing directory to an
absolute path for clang-tidy's -p option. This preserves the caller's path
resolution when the subprocess changes directory.

The issue, fix, and reproducer were developed with OpenAI Codex assistance.
Verified with Python 3.13 and clang-tidy 23.1.4 using a C file requiring a
definition from the database, with relative and absolute database paths
outside the build directory and a database in the working directory.

Fixes: 6ad7cbc01527 ("Makefile: Add clang-tidy and static analyzer support to makefile")
Signed-off-by: Marcus <baronmarcus2005@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 79d58b34..cc19f8bb 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -86,6 +86,8 @@ def main():
     with open(args.path) as f:
         datastore = json.load(f)
 
+    args.path = os.path.dirname(os.path.abspath(args.path))
+
     lock = multiprocessing.Lock()
     try:
         with multiprocessing.Pool(initializer=init, initargs=(lock, args)) as pool:

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.2.windows.1

