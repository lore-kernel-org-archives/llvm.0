Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2E1DDD1
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 03:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750648332; cv=none; b=iiocA50afmRrW7BMXijffW5xHPi62kGK1qvD9l/RI1GCFEGtr6bps+uOiqco6nqNxU6Pt0XmPGs5hE+L5ZEd8QLR2O09nwB+mXZ6B84x3i26AzXfVjTGUYBo0O8WzVLfojyrdZszzyxyL79kRqlZubGCsK6lQsjZfQCl9iK0fCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750648332; c=relaxed/simple;
	bh=062zTTQyJ0/C4oZdBagbLxvVX4gkJWaLZlvWkLH1hOU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gl/aMFHAiwnyB6zGa8DafqOiGwu3fg3fphw/ueaCeSUMX/6am1ic/SdF+WEQPzSgTH42IRvM6XVWSdVndrbDOefFpDNFtt4StbukrbIYHopt8RPO5gQ/pkYJD6/Zl5hw1YTKYDX4UR5sFUs2IMe6e3QLFBrw0uvFNYuGg82GXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZEF+4tD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZEF+4tD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750648329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XOfZ1x5p26YTBmPoZm7hVkx6/YXs7Emkoqw8RLq3iBE=;
	b=VZEF+4tDtej3lS7rmFKE/w+eobPRtSwoSqJmUVx250+U16BG4PNqKWVV0LT6mx/uwQP2Zh
	udcB09IG0Z6BGRYDOlIcG73AY4VeTjcqP62g5cUzOc3MqfPh57TqUez0F99tld4mALf6uM
	d7KlyNqPK07LbHi3cACzyMX3Q5iUlsI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-9jBSEem1NM64gbJMzo33YQ-1; Sun,
 22 Jun 2025 23:12:07 -0400
X-MC-Unique: 9jBSEem1NM64gbJMzo33YQ-1
X-Mimecast-MFC-AGG-ID: 9jBSEem1NM64gbJMzo33YQ_1750648326
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B898E1956087
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 03:12:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E18D180045C;
	Mon, 23 Jun 2025 03:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 2 of 100): Test report for master
 (6.16.0-rc3, upstream-mainline, 86731a2a)
Date: Mon, 23 Jun 2025 03:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <77385.125062223120700483@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DoCxLpzkmTMYEBd3vIW4OtRQcFTWN2krC22pV6OzhWk_1750648326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Linux 6.16-rc3

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1883142924

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: kernel BUG at kernel/cred.c:104
            URL: https://lore.kernel.org/linux-nfs/20250508051829.bdv2r72l2=
o5rsbni@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]


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

