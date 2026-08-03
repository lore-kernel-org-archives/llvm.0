Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A12BEFEF
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 04:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730934; cv=none; b=AF0SxHB/1SWqTq7eMdE8e1ou98tCLli78U+3oe6Tq9+nF6HclvpE7Beu+Si17vPt1Swuoj2AEqcG21G0cvT/+u48bh5GZZDu7IN0J8zAUIlfdhjYO9a/LOjriUC2OiMpXBApQhunMUpLIOtb9WuU2FbJ7gXe6VT2RfHiZcocM4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730934; c=relaxed/simple;
	bh=6uAurlfp4OG//p7kpB6jxIjG/3m8q7yUmQ1GRonrIqQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GITgudNEq1ahsd3Gp/VXW88QAmqRT4IEPnYdSRRL8rvrUeaVWsk0j9I/agaI1fN+qpLoWy3q5kcDkj2nqOQ0ouZ30B46cQTg59mUs0d0Nn4vU/aRo3zPEpMeNmz0Z7eaxjumVHFdhSUur3ithBCVf+DdZ9BVFEPAQYk12axtD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0cPjBGa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0cPjBGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785730930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G6gBruJCFo8dMT4tFf4Nx/Px6CviAETtAuPuGrPDEh0=;
	b=J0cPjBGaBQJRG1HM/tW5mFydwOWaekLkGTsoLEXJ8vdNQXZ4aczi29IHPRQjdFgZpZ9Lpb
	RJqbLVovnB1rKsQWeMiG6QhNwX6jox5gry3VfkC2px1ITUrFydjDXRWJYbFoUKE9VrqICW
	IcQ1TfXiuIc+KXhOKdHWAJ0cU3kEjlY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-_lNcyNTZNCanqPGij2iG-A-1; Mon,
 03 Aug 2026 00:22:09 -0400
X-MC-Unique: _lNcyNTZNCanqPGij2iG-A-1
X-Mimecast-MFC-AGG-ID: _lNcyNTZNCanqPGij2iG-A_1785730928
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D54F1956096
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 04:22:08 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE9131956086;
	Mon,  3 Aug 2026 04:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc6,
 upstream-mainline, 075b7484)
Date: Mon, 03 Aug 2026 04:22:07 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <98170.126080300220901283@us-mta-558.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MKojJh_1NzNPEZFcBpjCNmeIxq_gA6-Sm7SDTgm5suY_1785730928
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Linux 7.2-rc6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2725714664

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2725714664_x86_64_kernel_kcidb_tool_21783136_9
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

