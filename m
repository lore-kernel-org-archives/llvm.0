Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97E2309A6
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742589730; cv=none; b=n1t/w88Yul9+F3EvkPktD2twz0+EsiiLgtZBPmDuaIj1LpTMfp43OnfXRukKQZXyLl3FnYV3pHznSTJePxfAOddmOg1b3YDcllO/vz8fzyzaDhxtOlaQWkfI9tkvcIes63tNrN89gLN64odl08gQhIvIjZaYUlfzdGcs8w1nUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742589730; c=relaxed/simple;
	bh=APCNHAaknHH7M1DTdyYqSWnB3x74eA7xfMByLmCBcBI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q/WYDrRzeNHgJ8EsY5LkCSAzZ/VCJCpWSznQsHqAPoKgmt20UpGqC0ytw0BOzwYLVLljYYuPlY/YiCDyXJVXM0HCUJ7a30KUCLWTNWb3U01nbGt5rveJbdo09XXS9YPFfKlBOSYmxkdu52HPC8n/q6FMciA4OeoKAylShG56ECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9CckV8b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9CckV8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742589727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F3s1s6b3AWfa/S8pdadDzIxXWgBvmVLDEjMo3YRLGvI=;
	b=Z9CckV8bLArUQMOlbi8GRYVv8YugYWr+IQyk1um+l0/HIe4H+Byf2/eazDFJwV2ZeqohuW
	LQ7floVtCvh49ygPpwWiT2BxlvrhASRIXc81pclA4gQW2ggaPXKnMvddBvccwmG584u0du
	BIs1kpCAOnp3ORWN7kLCnATD7XL+QtU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-JJAUhCZwOdCxhtSx1s9GEQ-1; Fri,
 21 Mar 2025 16:42:05 -0400
X-MC-Unique: JJAUhCZwOdCxhtSx1s9GEQ-1
X-Mimecast-MFC-AGG-ID: JJAUhCZwOdCxhtSx1s9GEQ_1742589725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5FE019560B0
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 20:42:04 +0000 (UTC)
Received: from [172.64.14.55] (unknown [10.30.33.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D9CA1828A93;
	Fri, 21 Mar 2025 20:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc7,
 upstream-mainline, d07de43e)
Date: Fri, 21 Mar 2025 20:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <98277.125032116420500813@us-mta-64.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2ZkdNIih7p3A69sMSNczdln_4UJpZ4Wk1n45AwBbccg_1742589725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'io_uring-6.14-20250321' of git://git.kernel.=
dk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1728848376

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1728848376-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1728848376-x86_64-kernel
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

