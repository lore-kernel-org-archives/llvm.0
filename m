Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2A13632B
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360668; cv=none; b=PgN/DBjObL0X0tEdc0jKAWVgHs5ZvDWA02yFhyX2cnaoXPd+jdPUUOErxYMIUvaRyItxH9x0b9okl5YWaHnjIEG65nh79GHeBUk7i6f4/RnR3HA0i/XuqWKdYldAs0LB77s1DKH7MgsK6hVDHnYHLd6m4XkmH8CQ5cdHPo1PDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360668; c=relaxed/simple;
	bh=SuAZVC3SkxiQaATtgLLH2hnYpaxNd1UKpGf0Z6/BTx4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BcbNyS11FJwqiSxJHskyfCLJr/ic5smwv394g7FbJtXyky7bjLVOHu26FlV1hfAPNxtiwzs5impd5KxLc62n0XfEd9s/GDI/kcE7lS0hkdl0Wen50mUbDTirIdCUOFjQJvkQczVhkHzYm+hO2PuptPunpCLNikwGEcgLbGEC8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hq3yrSC4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hq3yrSC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jV+C5CcNy87PLfEIXpRk0ezwnJCL8rPW4bMrKpLzHS0=;
	b=hq3yrSC4Z2pr+5zU6UfNxPaYp8VLsCwpdPSJg61X9ty4Cp0t/IIr/LdJTCgDBwK5TfN3oW
	Hx0FdcJTzbE1/lHEUr7wfWlD9z/CNa56XmZ6qMIDAXoYqVxwK9FGSyfW5SPG0o8jO4dp5c
	fkZAQW3sqL/+eGHKJ8qhIFXRPfaj35o=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-xbexXnTBNXiQ-QM7aiB_Og-1; Thu,
 26 Sep 2024 10:24:24 -0400
X-MC-Unique: xbexXnTBNXiQ-QM7aiB_Og-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB6CC1936CF3
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:24:23 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A6C90195421D;
	Thu, 26 Sep 2024 14:24:23 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc6,
 mainline.kernel.org-clang, 89f5e14d)
Date: Thu, 26 Sep 2024 14:24:23 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <27105.124092610242402503@us-mta-67.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'timers_urgent_for_v6.11_rc7' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1444871619

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1444871619-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1444871619-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1444871619-x86_64-kernel-debug


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

