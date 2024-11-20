Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F7EC5
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732068129; cv=none; b=ox6Ee5Hwi8ZwMcucII076WJFCS2n4m2/ss1e/wy+mmy1w4vjFaLjg5m0EJlxzlFoa2WlLgzwyeeylNbNu1+/A3buvpBD7e7AG4xq9BECJTeD0zuTvjzXqZOe700EZKe+MgVmGNz+gK09KFgSCrDYEPKBNZatY/QN3VpbbV6my78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732068129; c=relaxed/simple;
	bh=kfC5AEp2KeGnl8FX4LOkBriORyv3t4ItrE0gpu34cDQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tQ2F7o9sADWpSV5n/WNbFXTVOHt3BpkOJWV3+QnyRToobu9En3ew5OvLQ/0qGoSHEiu/3z+KbhS4lXj9JiCGEsrQK78+R1Sjt2srIomTKfbaJFB/a+NAfOHX983+U1Xpz9TldvcT2bm9cNxXyReQSc2sTiDKln33LAriNgu36Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E3l9oqHS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E3l9oqHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732068126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pEUR8uo2glNsjHsbf1cONRRMKkIPuou3beH+As73dI0=;
	b=E3l9oqHSgGXMXSmEomBlJ7jZFXsOR4dXZwCM667qhTkbRbzVRjES3UPkR0LMUW0mjFTyNV
	HQqigrsNgfhbjqX+VSEKW4eOHzcIDTmZWEx/ALVn3yfdCAVh8/hfYfg0cLm9+Iu0oqIA8C
	3oNk5T/6p6wE1iU2cWhh2G0CZNONGAE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-7_PTxEUVMq277tv-xkJQ8g-1; Tue,
 19 Nov 2024 21:02:05 -0500
X-MC-Unique: 7_PTxEUVMq277tv-xkJQ8g-1
X-Mimecast-MFC-AGG-ID: 7_PTxEUVMq277tv-xkJQ8g
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 488AD19541A0
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 02:02:04 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E771319560A3;
	Wed, 20 Nov 2024 02:02:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, bf9aa14f)
Date: Wed, 20 Nov 2024 02:02:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <03398.124111921020500353@us-mta-508.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VtdHdFnZnrsJBatNrWlyUJBNe9vRRLqOh27q2v4gzI8_1732068124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'timers-core-2024-11-18' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1551809788

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551809788-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551809788-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1551809788-x86_64-kernel-debug


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

