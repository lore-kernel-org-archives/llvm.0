Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3DA25A643
	for <llvm@lists.linux.dev>; Fri, 17 Jan 2025 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737090192; cv=none; b=oaT7i27Kh1nh5fafL2gRfqSe3CzU7qS7NMyOZ6h9ufhzRCBUGpgfHkKcUEYmsJ4EgguNUMTdFs0b2Njp24KETahoq9zbJXey+WrajIRejDXodX65UDUBHksfT+uJfbtDrEbU3spXW/Pj836RGSnxjHFJe7JmlhADAh3htbcsDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737090192; c=relaxed/simple;
	bh=qdRxWTB45Wa4TFAK9vFDspHyCUFV31lHCe+9am7y47g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VEAWCGUGTZQi1pmMy8mTw6au+Z1BSYuvrJYdvpg+1uBuZmt4TDqlM1iRdlfzT5WJHi1PzMQGjZLuUUsqAPNAiqVjxDWpXCKNsNyx52nBW6VLldbQz2C1+2jMYBzigCmb0QEnnbUd0VkJZcqUALDJxOqVoAK4M2fWQu73HyhOJqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7Et9H5/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7Et9H5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737090189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2OpH9dBDpc6Nze+RCnFMkLyirXzKmQ8/forSv2CNS7M=;
	b=B7Et9H5/PQWhEWVO0NvfVkJ/Upov0SDIm1iVdk0ZIheBqywcfpnzL4EnofewwWbpAhMQBU
	L361XWIb+rnZGwZk5S5lSgg5Jz5ok/gAARkowF5UYB5r5eIxrsdvc0APsU1+sWstAwBziL
	na4U9qCE0Rxzb9juf+pQ05B5Wzjfqg8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-RlS6kGm8NUqpxQPRVifmDw-1; Fri,
 17 Jan 2025 00:03:06 -0500
X-MC-Unique: RlS6kGm8NUqpxQPRVifmDw-1
X-Mimecast-MFC-AGG-ID: RlS6kGm8NUqpxQPRVifmDw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 961741944DC4
	for <llvm@lists.linux.dev>; Fri, 17 Jan 2025 05:03:04 +0000 (UTC)
Received: from [172.64.12.20] (unknown [10.30.33.24])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20F9F1955D9C;
	Fri, 17 Jan 2025 05:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc7,
 upstream-mainline, 9bffa1ad)
Date: Fri, 17 Jan 2025 05:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <65679.125011700030600679@us-mta-630.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7tqH-5d9WBDaz1TG_U6sBiTXxTk8bZMJ1aZ_rT_GxAA_1737090185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-01-17' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1629130770

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1629130770-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1629130770-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1629130770-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

