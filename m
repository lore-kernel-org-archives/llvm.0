Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC5381B0F
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 23:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540131; cv=none; b=o1oOeMsycta5DhajWyI8v1vSIqYKOmBvFmrERgs1+7b2FE47EyMSdsQ9ewFh0nrXR5uQfOJL68oYRilGg2gH0Wv45oy21TEKHm4NIUTFpg48x+7jRxVOzGC1F5eaX5itmYivdsu1xxNDDi/Q8MasiBLbkgSUQDmtlT56oNirsPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540131; c=relaxed/simple;
	bh=1mMlCEyzP5PCzLwK8uawgsRvDZehD23jbNJ3GO3XhZ8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RSfcjp1YlJE8xx4QifPQnXwXIGsDmpbkPtszbRL9jy/DK7Io1pUrDXcg+J55C56hR06Y0sFC3y/Ef4hpQW02q5ooNZ/xwbzVvUmD0nxq8OCYybyAvuvmjLIQeOFqDlicsVpol4KfRR/YVuRPDTXzCOWk27bxgMOhKxwxqIVkx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRC9Fvrm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRC9Fvrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785540129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uEsy4Fy0ufH993kOnO9eAyKZfW/+2iAeH1z/EKSFVZc=;
	b=HRC9FvrmtjvEpEQt4AU5XXaUKfQd5X5oEk4siIpLNU1ZO4usMTWb1A8X6iJ/Q6SQMmbXAd
	pfNMlB/TELnd/pzoXAN2zk+vbzsm31ZIrdGTFgiFjtxpWfK1E3d52+B+EwdltIa+CxopyD
	UpZyM0ViFmy5Kp67WmouXZ2HMSYiX+w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-V5r6L4A4MB-LUaunLPLexQ-1; Fri,
 31 Jul 2026 19:22:07 -0400
X-MC-Unique: V5r6L4A4MB-LUaunLPLexQ-1
X-Mimecast-MFC-AGG-ID: V5r6L4A4MB-LUaunLPLexQ_1785540127
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D936719560B2
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 23:22:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8964D30002E9;
	Fri, 31 Jul 2026 23:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.2.0-rc5,
 upstream-mainline, 6269cc6f)
Date: Fri, 31 Jul 2026 23:22:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <77647.126073119220700785@us-mta-417.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mrciP2m5iHVKgkXA6UiYIqmck3zwKYwFgi5LUNxupoo_1785540127
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
    Commit message: Merge tag 'spi-fix-v7.2-rc5' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2722812033

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

