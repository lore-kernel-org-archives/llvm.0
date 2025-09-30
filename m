Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193425A2DE
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233641; cv=none; b=dZiNhb4b6qA/J7xRlXQls3txV6sjr2C986zBzR2Km2pY8SvZVDJ5oQt85oJzNXPsU4AMjouXQK24zHlXFgMNEjQfrAgiKjkH+2i6lyQ5Xe9yQma3dX49VyExQUKqdH4eA4KI86v+GlBMAYaLUWBMSovCfSfhTB3EIMkB4C8b+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233641; c=relaxed/simple;
	bh=FabH5mN4zhLuKZr9se2KR/RjA3IMi9d2QCJpAU9/dIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IR3tWoI4MQxcZJuCK1WXHvUmJHPqt7My/r1Cloa0oNjQxeD0PkLL+IADXxksf0GUc1zNd6qP6T9gXrAefVZ+miAjzo+yStdfkgOcJ/QGwfG2uFa7sS5oaZOfkhBQY4MNIJeKJDuZlnVQ8hiBz7XKrJ/L6s/uzGPtNmOOW/BJiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egNS8BK0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egNS8BK0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so4937821a91.0
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759233640; x=1759838440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgDDrNZnsegWRc2V1qujx9PuTP9rgoyvrSx11R8wMak=;
        b=egNS8BK0wZ6UIDGWng958kS9bgajYZZ6/lJSPO1XWR2ETK1PdEPzj+2utz5JHnHGrt
         dDvkGF9oSWj2iINmcGFCf26eW1ojpVn3WcMfb5OhpweDE6K13yM8oA7STVrcD55lSG3A
         FbsS+6PEm2tJzQq/PkFFMxeikiVUiMhuROXxhRWYIFiJ7tI5p0x5MUjnweJ2buJr0I+m
         wr8TL8U3+SC4ydrhbCTEsQPaQ6KyZmvo872WrRCk3C/U0ui0zqzJlrWSvjrbR57+6rWS
         YXMMCOGY3x7VqUo3U4cEVTfhep15djJ9ndT1EWOvIyw9L6vMVf2daVuYPywEGNmGlz6F
         eV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233640; x=1759838440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgDDrNZnsegWRc2V1qujx9PuTP9rgoyvrSx11R8wMak=;
        b=bvzjZJfRga7bcyGuGXt6GtjLcAvj6M7q4VLPHmmSEFx+ohRyCATmuNHKWFaM/RNq/+
         g111Yisw3r6tcMbkU6ofmxCPA4Os07qO5uYl35DSMYCy6x+A/C64RjOWj8wKkTvQ1KFM
         tZXnz2u4PW9MXIsxDtDPdqiHdSuyIHS9VF1Hi0m9KmxEJ3FmNtYTrx/jOAsJBQTpEwFa
         guLXuk/xGpZIhuw9R9Uy/QuFZEGriFgJ2xCHh432KPAEO6LEnRq+SL7dXYB+349OvGI8
         P6TsDwBAUOPHtgRhrMNJ41EgTk5dhhsZdVQwlvT5rL6qU7Ykj9d2Tfzu/9r/WOeiPR3m
         U19g==
X-Forwarded-Encrypted: i=1; AJvYcCXDP9ugaxIXVkp1AwF9m7Gpxz5NODPUBEpdwYDwvlxdUaFLJ4zOrZ4+Lv6Eea83XJ1+7ffZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp/q5NhtV+NqIsgrasM/E5IaxXsooboctNrf87FYxJkzPC4NnD
	oY2tx/15niP53W4LsnGmeKU8VkaMbua7zySdBewClwCWYnDlydTIAHOU
X-Gm-Gg: ASbGncvfxT8kPwTwafDuyElvakJmIi56zzbOiV77ZQeZUcRiewcH0xnrkR4LI0v2zk9
	e4IiYbMZMzvYagNBzRUumkAaK9ZlqU3QKGq8xWJ+tPtnPw8wt1O5J+A6Kpqbh8hzaquoaLW+lFe
	ImGTu7d3kd+Yb0xUUEJv5SlIH1ZFeg2hLUJZJTXdb7d6E56hqn9Xo58Q0wf5WRFrpmW7VHRsGwJ
	WP4z/jSd5QAi9m/brIsOwotV3oPErtlQsfJ0UtAtcHtaxp+2v22JDYEu05dpUtgiQikYTJ+EIoh
	9dYuQzdz+NhGhVDyyZrPZmN4A5YQ0T69z/HL0WPzf/UIF+mGEtHCq5wYj9vY+Pl6i23ppgIeZz8
	APSAE52GmVusu+1PcPo4f9YXMJgHY74jkqfUP4AwYRC8Ie38teBqfj1TSdzyAu5A=
X-Google-Smtp-Source: AGHT+IF5xytoamoNNnFsGzqI3I/1zL8QxwW1vpNTaidF0bgHfcirdj8j2+a5eRIDt+HWn3cuLf8DSQ==
X-Received: by 2002:a17:90b:4a4c:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-3342a23718dmr20535324a91.7.1759233639182;
        Tue, 30 Sep 2025 05:00:39 -0700 (PDT)
Received: from y740.local ([2401:4900:1f31:e91f:2d6d:e8a8:f2d7:94ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399cd190e9sm823160a91.2.2025.09.30.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:00:38 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: antonio@openvpn.net,
	sd@queasysnail.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemdebruijn.kernel@gmail.com,
	kernelxing@tencent.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	david.hunter.linux@gmail.com,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH net v5] selftest:net: Fix uninit return values
Date: Tue, 30 Sep 2025 17:30:28 +0530
Message-ID: <20250930120028.390405-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix functions that return undefined values. These issues were caught by
running clang using LLVM=1 option.

Clang warnings are as follows:
ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1587 |         if (!sock) {
      |             ^~~~~
ovpn-cli.c:1635:9: note: uninitialized use occurs here
 1635 |         return ret;
      |                ^~~
ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always false
 1587 |         if (!sock) {
      |         ^~~~~~~~~~~~
 1588 |                 fprintf(stderr, "cannot allocate netlink socket\n");
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1589 |                 goto err_free;
      |                 ~~~~~~~~~~~~~~
 1590 |         }
      |         ~
ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this warning
 1584 |         int mcid, ret;
      |                      ^
      |                       = 0
ovpn-cli.c:2107:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
 2107 |         case CMD_INVALID:
      |              ^~~~~~~~~~~
ovpn-cli.c:2111:9: note: uninitialized use occurs here
 2111 |         return ret;
      |                ^~~
ovpn-cli.c:1939:12: note: initialize the variable 'ret' to silence this warning
 1939 |         int n, ret;
      |                   ^
      |

Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
ovpn module")
Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---

v5:
	- Assign -ENOMEM to ret inside if block.
	- Assign -EINVAL to ret inside case block.
v4:
	- Move changelog below sign-off.
	- Remove double-hyphens in commit description.
v3:
	- Use prefix net.
	- Remove so_txtime fix as default case calls error().
	- Changelog before sign-off.
	- Three dashes after sign-off
v2:
	- Use subsystem name "net".
	- Add fixes tags.
	- Remove txtimestamp fix as default case calls error.
	- Assign constant error string instead of NULL.

diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 9201f2905f2c..8d0f2f61923c 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -1586,6 +1586,7 @@ static int ovpn_listen_mcast(void)
 	sock = nl_socket_alloc();
 	if (!sock) {
 		fprintf(stderr, "cannot allocate netlink socket\n");
+		ret = -ENOMEM;
 		goto err_free;
 	}
 
@@ -2105,6 +2106,7 @@ static int ovpn_run_cmd(struct ovpn_ctx *ovpn)
 		ret = ovpn_listen_mcast();
 		break;
 	case CMD_INVALID:
+		ret = -EINVAL;
 		break;
 	}
 
-- 
2.47.3

