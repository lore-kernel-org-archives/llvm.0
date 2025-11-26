Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089E30BBB3
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174670; cv=none; b=oGfFW/CoudIJJFqQkePERIWMG9S+cTnZ/ihy+LrCK5Uvh/WCt9rByDiArL3HO83hSeaxFB3MFW4OeymbKu9l6PCM+72he9fHl6bPYpJTsISV8hI4BRmM6QQRWiqAnNFc5ESnKrXXw3bbX6AybybspJq+LHDpyklvdTI+49+yVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174670; c=relaxed/simple;
	bh=JUk+V7+BC+lkMoAifGFTRedw6UOHlW97lAtjujuGo3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0GBKm946ewG5QEnnZqLod0/AEkTvnUQNa5hP0zxatB8ZNx9tYd97UXv/Pt1APVhu+IRErd8c5c4IpRWsjrDoh/mH3kqDpXA+Dm935/MN3j1Ebrxr3CUIVhmX+8kgbhXc0Wq1uyktyKTsUQ7YnNuWl8pLmWPitXIKTKU0TZii0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzvjDQDN; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzvjDQDN"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-340ba29d518so4438532a91.3
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764174667; x=1764779467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOzfVQwGYNqC1lxFkH12YuFq4cbbjh7siJwig+OWKTg=;
        b=kzvjDQDN/mPRBaW/3ojKZ9KEpUlOZnEMhwqAkEWvIOuiHZUWw4D9uMPeCL95+6GpCv
         N/H3YI1ZqqgNS5hajaF+0h7/xW+DSiUFFO6eS86mC1+Sw1jCU0UK3QiOgqRfuLTW9suG
         F0LHu6VeuwNGeEanzCuyzsglyz4W+3gJ5JUWy3OyJG63nmscTH76YeLKbuRBzViTiVB2
         g/EuLcT5htdQUZH0TpONkZr3gxbChaNDaxcN/0JkOXFW9UXVJ+8leNyXuSVa/PYVPbNN
         iRaGThNLJNVbVqJwelgPz7LX1Ft9ERU82oOfe+oWlAICOcOxyp7ssqmM0Rhw0rQQ84IL
         OHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764174667; x=1764779467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOzfVQwGYNqC1lxFkH12YuFq4cbbjh7siJwig+OWKTg=;
        b=glMqTlOJZBg/Sr/hwJUgyhSSWoxbbMMD/lS70H6kDKCLAlvFk7z56eymUZN4ZM8E1e
         BUcJXwj3fQEFg/QXZaJbouYRsftCsRzPpzGdHStYGa9xSvVMUEzh7sme4/PU3VFXu+Dz
         DYmX2QYA62cUuVYmZEr2dly1uJKj1u4kArhmmUyvcY8wi/LfeeBPyI8igExc0NFEv7W5
         CWud45lz3/Aqn6Sc2KCyLkFtOxp1vKuKDFRw6tFFWvKNLwNnqz8DZIigaG5KirmGKkWC
         n6GeWatpgWT/iR+vmUMLSwH2n302RpTIJDP1JOy3akXBVAy1joIFDXCzIx4VuM615Fot
         5A1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC/MEmzfYHZsL0sUFzkbN3+W2yEUN88eUcNVFvibVnhE6wVTP9ckzqMswN4HAyOTt6/6wk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+woqadI/rN4BinUccwvNTiyT8BaPoCmKpTimaoPS+m3P/pDqm
	GhUmQAyZ0uHLJLVGGd/4kDN7XzqdYhjov31WezSpUkddRzgCqvGKHX+7
X-Gm-Gg: ASbGncvLDG3Rrwd1RzVMB0ycvRGgneSICalEDhMn/5XsjdTFwSnj84G5FpbKc8+CWu5
	6cNuHskZa7j/nIkteXimDmNWvuvKo+hwktpp2h4a2uDU2tKEylPYBCNzyQ0JJzqLSlZhdeH9hks
	vC38Pqd/37eV1iNhoPuDbtuzuHHbsxqmQNCLo+ymTBcQwQPPxbGJR62atmoUIuGcpipb8LZ/Kqs
	KFPAojmf87ofk4f2hRTvkjnw9YHnAj2juqkjb2jrzkf4HKZv669zbzO/6dKmEp5KnYsL/8/oFAs
	3N+5w3H6YnTIc1Jy5MwGHNrIW47riMizeHgg3l/ojTNZyatZTi6IGOPZovFTY8SVblujh43dtgD
	9EWcZS17YJbuGg+LkviK8TsKAs3x74akhXhxs+U4k7BdwNFEJxe/D4m7UhEzdFXJae0t7ruAb/F
	O7psAeE8O332fT4ri8sTy5d+Jo7QzTZg==
X-Google-Smtp-Source: AGHT+IHYlOs7ib3WRoxz+IosxSmgFDE9P7H1+e8rCoPRGJ8hqrHc7dD/TBxgldig3bre3IVxR56yzg==
X-Received: by 2002:a17:90b:2247:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-3475ed5141bmr7678530a91.17.1764174666979;
        Wed, 26 Nov 2025 08:31:06 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd760fae9e2sm19829401a12.31.2025.11.26.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:31:06 -0800 (PST)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Shuah Khan <shuah@kernel.org>,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] selftests: mptcp: initialize raw_addr to Null
Date: Wed, 26 Nov 2025 22:00:46 +0530
Message-ID: <20251126163046.58615-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "void *raw_addr" is left uninitialized when else path is
followed raising below warning.

mptcp_connect.c:1262:11: warning: variable 'raw_addr' is used
      uninitialized whenever 'if' condition is false
      [-Wsometimes-uninitialized]

so the fix is to assign *raw_addr to NULL to suppress the warning.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
compiler used: clang version 21.1.5 (Fedora 21.1.5-1.fc43).
compilation cmd used:
	make -C tools/testing/selftests/net/mptcp CC=clang V=1 -j8

this maybe also be false positive. But somehow clang - 21.1.5
triggering this.

---
 tools/testing/selftests/net/mptcp/mptcp_connect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.c b/tools/testing/selftests/net/mptcp/mptcp_connect.c
index 404a77bf366a..cdb81e0d08ad 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_connect.c
+++ b/tools/testing/selftests/net/mptcp/mptcp_connect.c
@@ -1248,8 +1248,8 @@ void xdisconnect(int fd)
 {
 	socklen_t addrlen = sizeof(struct sockaddr_storage);
 	struct sockaddr_storage addr, empty;
+	void *raw_addr = NULL;
 	int msec_sleep = 10;
-	void *raw_addr;
 	int i, cmdlen;
 	char cmd[128];

--
2.52.0

