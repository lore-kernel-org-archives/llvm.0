Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933221885D
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741354333; cv=none; b=AAf0qqFNcQv+GulGZxmUCwRngvZw+BY1EUBzQldpKi1AGKt/J+nPPtg+FSEhgUQEMzWt6IrEbfFvdl9XVDCc0hUHetEkgc5czx8FsQF4V75MdJKElti4EWEHmlruBrks8Lel2IL19Wkj0bHrhIr6b/u+bPTdmC7mNDC++2So0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741354333; c=relaxed/simple;
	bh=AxojdBUpY1p9+xloZE52McprxGSCk2+xilr9/Pn+9s8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CkIe7xKcTwNa+H7+ibrtF5iuzzrnnHzd5Coukg03Su1mybUzTKGcCtGj3IRov4Wwu17NzKshBwtkQIkMKUAdQOHMl8FrGC23P8B7nPcYxyjhFAVPi41OCjq3TqvK0PgYvzMBB2MUcTBK1UnHHS2S/r5Crn5KImsb3EA/U5AZpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgEtt4RV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgEtt4RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741354330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LYcD6P/IsHRQVakakaYJKVrRNntNmuwyHanqqzFEu3w=;
	b=LgEtt4RVhAFH+Ehz4CeC8mUkYjv7mHmyUw2nPcwlX1TNQW6NU16vhOLYaVBvOpHTypZku+
	5VvtuiICkbOwzXROhJBr/sHg7oH05J454M9//iIY6OmuqMEdUPWMhbfWDBiicCURC6Svag
	1sW+PghWp2saofJS7sfytAP9EbvIBZk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-57-vO48WGa4PJSYuU56XEqi1w-1; Fri,
 07 Mar 2025 08:32:09 -0500
X-MC-Unique: vO48WGa4PJSYuU56XEqi1w-1
X-Mimecast-MFC-AGG-ID: vO48WGa4PJSYuU56XEqi1w_1741354328
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 609001955BD2
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 13:32:08 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E2D1B1944F2E;
	Fri,  7 Mar 2025 13:32:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 00a7d398)
Date: Fri, 07 Mar 2025 13:32:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <31766.125030708320900539@us-mta-57.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dykV6ELvb11QBTBpKDV1BZhdhvZLjgcHbpAt574WexE_1741354328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: fs/pipe: add simpler helpers for common cases

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1704841426

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704841426-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1704841426-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704841426-x86_64-kernel
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

