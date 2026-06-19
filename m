Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3B281525
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781843530; cv=none; b=n4RcPyqMMaBSUCKWGFzeN0pkt8znxYmY/ugqMovklyC33y1Rv7/Wi0mWmFwGjiL9yyRqgfIDpia4huC4dZNDnTFJlZ3CvzD0cazczf1zgYIrb8wv+KWbUZgDR5MthJlYaW3awhqzZxIetXJ0LSCsV5VwEqWYdfjJVp7cXpRoAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781843530; c=relaxed/simple;
	bh=DvMyfJfK+l4I2jheV+mERiSRCAfchAlI2hij/9VC31o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=p10EM074eTd5CssdZ9gYkkNPp2Sfc3Vsb3nh2HappnCPkFFvNJQONJ6U4veVFRHkl0KZcUxVYO6uQfmhz9mN3En2kl4q1vbsAMp/kVN70c+5Z6ycNu/j3lHprczf8uTYmTp8nHlgrNCcH45OIKW8TLMObbqx5j/Bckrnj/Xry3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnkIvDR4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnkIvDR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781843528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3sJTv+1xYzkBaJ0nkuzZQy1jpQlRk2rYoXymou7J4tc=;
	b=NnkIvDR4tNY2DHv2SuyAejQ2Dlpkc2mTApiXDJabpIdFtBDiajcpJWf/mXEyWE0Hel6JEn
	9CBUlPcTvNPX3QxmUr3qAKLPv9mUYD2lVXJNZWj/pHV7yktwWja8+JoaAwkgzzWVfl3LiO
	q4BefVOPm2EvfFh99jmhwtxUqsxR4Ws=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-7PoOMvYKNeeaJ8LudLK9Uw-1; Fri,
 19 Jun 2026 00:32:07 -0400
X-MC-Unique: 7PoOMvYKNeeaJ8LudLK9Uw-1
X-Mimecast-MFC-AGG-ID: 7PoOMvYKNeeaJ8LudLK9Uw_1781843526
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2524F1954B20
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 04:32:06 +0000 (UTC)
Received: from [172.20.146.70] (unknown [10.30.45.65])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70D161800599;
	Fri, 19 Jun 2026 04:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 9e7e6633)
Date: Fri, 19 Jun 2026 04:32:05 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <83353.126061900320700494@us-mta-497.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yHqfE9BTDixFo9_4VUyurzO98FQ83cKMrwXZlDCYO24_1781843526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2612229098

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2612229098_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612229098_aarch64_kernel_kcidb_tool_21488996_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612229098_x86_64_kernel_kcidb_tool_21488991_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

