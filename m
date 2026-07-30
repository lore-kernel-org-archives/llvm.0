Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335D38AC97
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 04:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384734; cv=none; b=mjuf2SOFnIZ+VHwx9XmtOQ0wVyKIQjq14+Y3nsZEtjuF7WInGiqoGbNAk+/FHe3y7/yW00p3+1x2Ei99UoWh6l1bimxPpXAStO87tilJi9HeUk7KupgGDNl7QsFx79vqDondKZ9Nsw7jVv/00mXsLWZmfR8Q/LkEa/vLuT2M6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384734; c=relaxed/simple;
	bh=0IrwCkEl/joxA1U334xQyaku/RNk0l2+6hH9yXxsv9Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=et2z6j2iKSN/cAVNJUa45dAhw0WorggK4GAjG4FAd3hzI/gN8n2BTJEbHQa6dPqdR/a8f2JukwJIOnlydh0p5tRrqt6RaUIi4I0mDnb36ivbpphBHuAj+FVYKTlSf4xVdqV3iqN00CIlCLsJtbhI66DzN0llTTJNVkDkO6F5qgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O681lWme; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O681lWme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785384731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RA4kpCnl/KQsa8zSFMuITVbSCOBQqK2s/7wBT+z/Br8=;
	b=O681lWmeG2NEAF7empSaG0yrCF9Ag5ssr3DVSgMnFzjQYJkzBjjQJq5+Va+VTb14jw5Qu1
	K+N7xlmdy+lRhL32zeYifvDwCTA4K26K4HTt60s9fTKRzCrE2lla7EUZaJWme97mdEC88K
	VgKGyaeUyCAnBJTjd/PFAfubLNY2kQ8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-BqB9HDxMOUK-TZkq6f8YPw-1; Thu,
 30 Jul 2026 00:12:09 -0400
X-MC-Unique: BqB9HDxMOUK-TZkq6f8YPw-1
X-Mimecast-MFC-AGG-ID: BqB9HDxMOUK-TZkq6f8YPw_1785384728
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 653C0180044D
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 04:12:08 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2210941C;
	Thu, 30 Jul 2026 04:12:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc5,
 upstream-mainline, fc46aed5)
Date: Thu, 30 Jul 2026 04:12:07 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <54093.126073000120900361@us-mta-210.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8JlpE28R-x4pb5BIFeLGHjtHxI2ert4WGiAoCb095EQ_1785384728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2716959078

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2716959078_x86_64_kernel_kcidb_tool_21756234_9
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

