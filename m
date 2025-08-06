Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18EAD5A
	for <llvm@lists.linux.dev>; Wed,  6 Aug 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494395; cv=none; b=odHwdcl+CogfvhT+iqrqtC/T2kwm7P6MrFCsf8dDvvy/YzQSMuVtOe12Frh3mEnWHQiEGKPzF2S310Gkb0G+mVD9VGsMhpFA69jA8x0zai8EUVK+iFDdoDbjtgFxM/kaf+HzyEYKf6PNFRd9ETCx0tZ2f48cbHif5LogPP8KhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494395; c=relaxed/simple;
	bh=kYvA8M3/4C8/pEqyrQPEIG3jDxcIRxUOwWAr1OAnA1A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QU9HfWXhyeIDdVZL1dCBipS4Au/7uuwfd6+TlmEPQPca3nfizIG/iqGTlhdb+s+D7dgnEZGZvhumtahC2t4ZQ/WqCtU3Do2j8m5xk/Ej6yxzJ0uqBdmxeUy4ORgr4TuoJWgUtRPXxJEgHmziau716kcTBcFUH1TXx1r0D1acYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=df2BYvDq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="df2BYvDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754494392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rH6vdTlpokf0cjUfgbiCF1CIPInQZD4QTeqRWStwW+Q=;
	b=df2BYvDqlsQusDcKtsbMYgqgNWjYEcnxhj15RQYVF/ciBdIhYqhHnoKCsQHELXiCoCnlSL
	m3hiPw4msJq7yof+N7ugIg6jRUlcKOC0tnbPuQ0XD3HPtGlWLErxEmTGngXcu9vxtOMNqI
	nStQDSJKX78OM4s0dhZtbSMT+voCkfs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-6iu9mDGpMDeJQqR1KERtjQ-1; Wed,
 06 Aug 2025 11:33:11 -0400
X-MC-Unique: 6iu9mDGpMDeJQqR1KERtjQ-1
X-Mimecast-MFC-AGG-ID: 6iu9mDGpMDeJQqR1KERtjQ_1754494390
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20C01180047F
	for <llvm@lists.linux.dev>; Wed,  6 Aug 2025 15:33:10 +0000 (UTC)
Received: from [172.20.10.107] (unknown [10.30.44.106])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9066B19560AD;
	Wed,  6 Aug 2025 15:33:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.16.0-0,
 upstream-mainline, 7881cd68)
Date: Wed, 06 Aug 2025 15:33:09 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <15227.125080611331100931@us-mta-472.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xnsoWZJJWogsHaO_aJdS-prkW7tp2cpUVCUIQZF-GiQ_1754494390
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: media: venus: Fix OPP table error handling

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1969022353

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1969022353_x86_64_kernel-debug_kcidb_tool_19301427_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1969022353_x86_64_kernel_kcidb_tool_19303022_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

