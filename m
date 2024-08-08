Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0015A85E
	for <llvm@lists.linux.dev>; Thu,  8 Aug 2024 22:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155787; cv=none; b=XA/AfCMYJDyoxHdh8pfqlA4Uwhmei8hrQQTUGXlk+TZLXDCiJku0b8CijDmGBXjkRDadqpLMGtMaemqY7cDOexJ+i9UH+feSLDo0H6/BDsoGeXl5DLFPabCPvqG8vWm6BNpASQJOOS/Hq7dgKKujpPuy5OGdVJ1kpSPZWiMK070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155787; c=relaxed/simple;
	bh=tmIQ/DlTH1V7T2luScUTWd798g6yBR+q+8Bbi5YXvfc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=V0vtVIZWMMz0+fjgChIxrVwIHE4zk0ziplkXmfDWjpwwJtGYnx83gT651PC7A7Kju3LZMulef14Fm7Ve42Dzdseo/s35MMorgGGayH4OHWfFiAUn9oW0mlnxhJ6jHgcixou2DC89QguvETVgZd12I+9MX1HI2OyeW/zqMam1wkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HG3rr2sN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HG3rr2sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723155784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XHk0x5FtMLq6WfQs8xdqYQN/hfXzcw6KcN2izkKBVj8=;
	b=HG3rr2sNk3hafDu+/0EQN5s3rxaVuWt1WqGJ2QDm0pfuMgJhfpvHZPOqX8J2ncKzwx/K6J
	msyK+AY7QsDHfE2Y/TvhDL0112w70Zw3GNw1mZe1UafDX82ye8MNnyxaSPQoNV4jyv2SNn
	JAUFT/wVZkvXGr+jbNjh2uxVvZH/FwU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-FZztJ0JmMu6oV3PlnrY2Fw-1; Thu,
 08 Aug 2024 18:23:03 -0400
X-MC-Unique: FZztJ0JmMu6oV3PlnrY2Fw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECC221955D45
	for <llvm@lists.linux.dev>; Thu,  8 Aug 2024 22:23:01 +0000 (UTC)
Received: from [172.64.1.78] (unknown [10.30.33.143])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 522FC1956052;
	Thu,  8 Aug 2024 22:23:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, ee9a43b7)
Date: Thu, 08 Aug 2024 22:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <94324.124080818230300718@us-mta-586.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.11-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1406410739

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1406410739-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1406410739-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1406410739-x86_64-kernel-debug


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

