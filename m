Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8352E3395
	for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743382337; cv=none; b=caZe4gqzsl1DH83wS3YDpRPL02CsIOGiW53/HdTyvPgEpuq4O4sdKSCXENKUGnPsl23+yxDgymjJsNg/2wWlhNDKf4QPmdkndpGdNEmoi9MwRsBCc1Gb2I5ugdrUUQRTY6r95mYIhr8eDhwTD+adNrnw1vYIrb4i86IipCUb3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743382337; c=relaxed/simple;
	bh=Rr+q3I6vEMbyj8p71GzElcXegrV9nObt7PXF5TUHVXw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=pj1E2ND3tZ7fjbppyxUHuGHvpDvWJC7+DBJQpKVjOppA3jJo+QkQFcCoJt+rXtSHXlLtelm7pGJ5C84TfRMmUcCVGysgWLzcUE4biLdKjS3Vrq5jv2/eOgu0c2DlWXuGUZs+EOwdhXgbx6/KIBBo2Jq3MqZ54rVgswkPbozmljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cn69L70p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cn69L70p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743382332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KsL/2q4p8/PJIb/w3H9DEF6+zoXLfC6kpBdYW5alA1I=;
	b=cn69L70pvTxWDebkGOZR/lUNaVj0JFeQ2Htb6peB8ZngRMzeWxpKJDy6idNA4b74Paq4CO
	dtk9hR1NObJQ+N7kPOV6mJYj/JzCFlurEmXvAjcB/gFTqDDK9i+1odZ87Z8nSlh1B4OFof
	ozOC82XsPvqs4T0n7F6IWgZ1X1h67Hk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-bzIcfRrUPN677Dp4EDEY2A-1; Sun,
 30 Mar 2025 20:52:08 -0400
X-MC-Unique: bzIcfRrUPN677Dp4EDEY2A-1
X-Mimecast-MFC-AGG-ID: bzIcfRrUPN677Dp4EDEY2A_1743382325
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAD9E180AF5E
	for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 00:52:05 +0000 (UTC)
Received: from [172.20.107.51] (unknown [10.30.45.88])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E3381801747;
	Mon, 31 Mar 2025 00:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 01d5b167)
Date: Mon, 31 Mar 2025 00:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <69786.125033020520800773@us-mta-225.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TP6IY3RsuGBOOQi7jfi_sDGGRWpDWmpCgK5RSOC4uIg_1743382325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'modules-6.15-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/modules/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1743619167

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1743619167-x86_64-kernel-debug


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

