Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B5A18027
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781847141; cv=none; b=GAw8zC+1561tZBiOw+30862H636Cq3OrZm/YA/6f4dEctpi8EGiSD740YfsbMIRahd2Sq0oWCDN4efU0GKIATtN0d5rOpqw+40NpGtAlYUuXf5Ug98Fb1HNmsPRx8vBe9VC1ZTkR2IbRT6bY5DKO/L/BATUw/7FcOA29m72uTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781847141; c=relaxed/simple;
	bh=z4Q/jjQQOuwk8C1eJcLojB1HX6bv+m+Qdl0VekzxSDY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rHgZRkL4rNeRemrWhhLtYZZiaka8blmzgYQwfBBukTTluaAzV9cLoIpqhwXw6oKwz6QUe7ltLDLp5qmtU5fxFt+tvfSPq2ieEcLehO9IXfqsa9EVRJIPBEKffmnYcG2pdVPwjabSfxtkELwHC441TpvLZxBw8pomX+LX/YFrwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b+9eZfG1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b+9eZfG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781847139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9arWxUkumhcscdKoEaUS/8JhZbZWf/O+4Aq+Jlcm4gk=;
	b=b+9eZfG1nf8oMqkQuquThnWRxkLNoIv1nRLYR7V3QsI/5yW8lvSp6rM9/dhDxRpXJitNML
	m64bvzhYdu1F6Sjr+0IpDgiySZ7jyn97NlG1lOdkM/v330amg5TGtP7pKoYe2GLxmIWfgz
	X19J6VBbw7dD6NyItKCFOR88hXefFI4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-fySJ5JZsNiCZh9VI2MJO6w-1; Fri,
 19 Jun 2026 01:32:16 -0400
X-MC-Unique: fySJ5JZsNiCZh9VI2MJO6w-1
X-Mimecast-MFC-AGG-ID: fySJ5JZsNiCZh9VI2MJO6w_1781847136
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01C89180057C
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 05:32:16 +0000 (UTC)
Received: from [172.20.146.70] (unknown [10.30.45.65])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95253364F7;
	Fri, 19 Jun 2026 05:32:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 6edc2007)
Date: Fri, 19 Jun 2026 05:32:15 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <18422.126061901321600252@us-mta-607.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nf_LdApQXo_6dCPm6lxuf43WlXE1MFn-_4CHih2siZA_1781847136
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'fuse-update-7.2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/mszeredi/fuse

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2612296793

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2612296793_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

