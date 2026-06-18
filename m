Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818F31ED7D
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764992; cv=none; b=JnEozgCU84YKqgKvLCnnQKbBI3tTLBQOSSQBpdu7pcOqu+nmE4yY6QleCdhajjCkxYJfPl7/5T8A4JZMgLzJ4DjlFjk3ZlqcuAXTOlKg7Zj2Ll220Xntk6a2NdIVoYDwSNNnulijx69ZgWLUy6PuWqwvo041g5wnHLfYI420Fyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764992; c=relaxed/simple;
	bh=S19H8jqlLqEi7QnZ3efSV9msabbhaPHn2CDHUa89JCs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qbp1NMFHGu4eGuuH/ku8vmfofmWsvPbA+0wdf9Dewz1GKoQgB7aoftJeZdFX/ABLpiFaPtLr4T3PBFMphHuM8xz+sW0omZtVFcCdJ+rDbe+udqE5WNteeRvNzekK2+/tAIlDiMqZhjuHAXa+bOlShtxt3zrrao1ahHUfnHo/ufE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PSMQ9DWC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PSMQ9DWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781764989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VLHHrpH+HlbmR2N1F7n7XUm/pIo+qA+yxxrm4V/HBSI=;
	b=PSMQ9DWCVxO6Arhm03paztKySjRwCdQvwK4poSh2VaOhgf8vwpW6VB7ZtKFLe59rEiSVJk
	cYe/9hWzQAkp4+g7yehX4j2mnz33I3QvP8DZomDJSqhHTAYizmbKooz/NusxoQexU3dcRY
	7D1+ChVRyf5YNuDRmrb2InrPGrTBzd8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-y-Kp8Z6rP7ykaCMtWHuevw-1; Thu,
 18 Jun 2026 02:43:06 -0400
X-MC-Unique: y-Kp8Z6rP7ykaCMtWHuevw-1
X-Mimecast-MFC-AGG-ID: y-Kp8Z6rP7ykaCMtWHuevw_1781764985
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 533C21956067
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 06:43:05 +0000 (UTC)
Received: from [172.20.152.42] (unknown [10.30.45.46])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C1C11688;
	Thu, 18 Jun 2026 06:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 6505114e)
Date: Thu, 18 Jun 2026 06:43:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <90725.126061802430600209@us-mta-68.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ij0v9SinCRnu4G0pD0_JL6d9ybCOnAOfDoixGH_q7r8_1781764985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'soc-arm-7.2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2609483636

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2609483636_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2609483636_x86_64_kernel_kcidb_tool_21483495_9
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

