Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02D3C2D
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782523392; cv=none; b=Jr+TwZIOcbqirUjHpJUK5I7r/EqUfzxpjY6B04LkzCg427hv70/HOSRoIGjcAEOdPBajAlo+iZ3XJm9EwGAi3IiYCihWnHG+L/rLiP2O76181YxhJmjMBgm5PdJjBrQD4v6AO5auDPGS+jMZwnHKtmbxPQI3YpMJal0Oo1HRaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782523392; c=relaxed/simple;
	bh=0hFNtW1A9I/syMc/Ngrv9hBxAbLksulMLPppKi2AoPU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ik544+CPZE22ehZf6DLg+IOIpb+SE+L1n5Ki9cVl+WEWNEG4Q3iD7lBccUy1+Yi073iH8LPPmvwnvKz5qwjFqa0U6zn/F1Cyxxv1c5UFdU3vRuUY06T7ylB0wZLGxWNrmKaNTvHeAo5dfhm1fFv9X5xmedImFHJQer+6UR8bMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eb47jOgC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eb47jOgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782523390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oQUoGMlJvhFK+XK7bETRg/6XAxrIBZZSHwh8MJbZOys=;
	b=Eb47jOgC+gsCOHX3P/3qNuCThTLNyd71k4LcodSOhZ9CcE67IEsnRhtV0nelFprbXC/QbK
	kHxu9IZGN7073/4Q9ySZcLGpfoml2pLKNkmovpHlk3zSYISY1DpVI3MgAj5vU0EHCFXUcn
	XIoKyvX3ypmFKkEukdHOXedIJjHm+YI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-RcZJov1BNr-r6rs-IjEK4A-1; Fri,
 26 Jun 2026 21:23:08 -0400
X-MC-Unique: RcZJov1BNr-r6rs-IjEK4A-1
X-Mimecast-MFC-AGG-ID: RcZJov1BNr-r6rs-IjEK4A_1782523387
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97133195607A
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 01:23:07 +0000 (UTC)
Received: from [172.20.0.221] (unknown [10.30.45.125])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4B421800591;
	Sat, 27 Jun 2026 01:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, c75597ca)
Date: Sat, 27 Jun 2026 01:23:06 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com, omosnace@redhat.com,
 mmalik@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <34447.126062621230800513@us-mta-204.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJ4GjMoqdYUTxucX98Gj6dVOPZQDCWxZOVuKU01265I_1782523387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2629912648

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2629912648_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2629912648_s390x_kernel_kcidb_tool_21526094_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2629912648_x86_64_kernel_kcidb_tool_21526091_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2629912648_aarch64_kernel_kcidb_tool_21526096_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2629912648_aarch64_kernel_kcidb_tool_21526097_9
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

