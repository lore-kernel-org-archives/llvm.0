Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BE1F5842
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785469931; cv=none; b=HXfcppzvxX4uQ5wdWCDIqzRRthAeHRJxV1+A5riyq98w38Blix9LUcQESMVvAIqT1mEWbUtBX51mWubdwws9cJ+FiHfaI9GEfGRpX6vtdBktf6XCGiecup1883uYYzKsKQmBsaZGt3aKz+O2MHW8DDkRAFIfbGi7kQvink3jri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785469931; c=relaxed/simple;
	bh=CTO6RWB1AvipRKCyEksPtEMq2O3SEwDKbQbD4dak98E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=omOWBw/qAF2Uy+3WHg8n0dp38ruWhw4eiwjal2izx+JJxn+jPB2pPyceU9cOjLYY536ksduQ1lPLk23aslksbottXiMh/B6wEh6UB8dh5LxPfUE8B2Vf6SQ10xIiPM9IRkeNfk6FjS9zMyBvxkiOdFhlpe5lZwROEHLhGjOrOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0irSMuI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0irSMuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785469929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DAzWK0n1Acg2TmKaPjCnCRhNTEKnofQ2DDLkdlntAYk=;
	b=a0irSMuIP+aWFOZUZfOKCJgL73jrx5uPRejt6ueQpaUwRfOaIaaC/6bHOXRbbrDPdHyiBj
	5hBExeIxaZP1gHDW8771RlsI1Kc2q8fOqX3ZV6D71jGy46FMbqxZ0y1iQKK49SUMGvnHht
	Ckt13bTO0l7u8sgNdtENPessidsZ1xg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-VwG95zlAOdK9XxTXmhNO9w-1; Thu,
 30 Jul 2026 23:52:06 -0400
X-MC-Unique: VwG95zlAOdK9XxTXmhNO9w-1
X-Mimecast-MFC-AGG-ID: VwG95zlAOdK9XxTXmhNO9w_1785469926
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBEA21956080
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 03:52:05 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 442DD180044F;
	Fri, 31 Jul 2026 03:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc5,
 upstream-mainline, 8ba098e6)
Date: Fri, 31 Jul 2026 03:52:04 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <17109.126073023520600469@us-mta-186.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2ddHl3O0zzQ1HuVUJcTPJal0BQyMikNrVzQFSNXgKhM_1785469926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'v7.2-rc5-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2720393917

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2720393917_aarch64_kernel_kcidb_tool_21764504_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2720393917_x86_64_kernel_kcidb_tool_21764501_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

