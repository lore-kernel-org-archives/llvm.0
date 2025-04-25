Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1FE22370F
	for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617390; cv=none; b=ZY7aFYL7sfHYcR0w7BW+YW6qIoaqi39GZNMnbskrX8JQ+lbhOpGH6l/YTPezUNWkJbQT+QVFgnHlJqXtLb2FYkbKCKffQ6xYgm4Ze9bQyv6Nl7DSrHfAaXczspA1eynjYBTK56M63dnMWmSD/TPJiqjM8rpkA+3TLh6sAmTkUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617390; c=relaxed/simple;
	bh=k2hotvn07C9VXk9fVRwyEEVytdMU+YL3nFbd397KHb8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bcVJVSoykks26DP4mYzJ59dmAssEd6+7zqSATjheWMAAeuqFqoSRb0E74ah1oW8/xlmLPRkYCwCfnR8ib64B7eHMHI3oqgMrol/R+950TJGXoKvoaT9GP0Rq6wyq25Uu4wfR//TCjkRIrn7h5hTkwQyMYvAPWOXiXzPUzvHRWik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AQkpDGmy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AQkpDGmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745617387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aFF89xQPMRNzTzF4Y8VELZ/4iQhwb/H867PyrVexvEQ=;
	b=AQkpDGmyNF7kklkrKtsDS02be4o60/oH9jOYS2C6vtpx/M0b3VOiXxDsRzUqxn3UY5GT77
	lzy4Ej+8u87w8Za1V4SIIWLZ1LGDZRp4E9dK+pV0wylG+DpryhTzB5hYjA4H4rGKRhKVhj
	SZdWHvvzQ0/TGcFw1dtPtN16cpq1tTw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-J3bJP0f5P8WTimAwUJ63vA-1; Fri,
 25 Apr 2025 17:43:05 -0400
X-MC-Unique: J3bJP0f5P8WTimAwUJ63vA-1
X-Mimecast-MFC-AGG-ID: J3bJP0f5P8WTimAwUJ63vA_1745617384
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 748EF18001D5
	for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 21:43:04 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 065AA1800378;
	Fri, 25 Apr 2025 21:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc3,
 upstream-mainline, c405e182)
Date: Fri, 25 Apr 2025 21:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <03199.125042517430501946@us-mta-381.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vd1IbomIJTtU5JEM_w4oqiSfDQEeehePKmbcAxFPWS4_1745617384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1787046011

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1787046011-x86_64-kernel-debug


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

