Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB54182D6
	for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782616992; cv=none; b=hGQFDgS/SErs+mkqZrScY6Fg405E9l7cORKBja1yTjCS6WE340hHCAy7ZgTKzLOw43LJ1rOcnq3yIrkWpDLNTIfTc0jBrtCiSVfP7SdICJ3qFld9QKXfMROhjz8isDKaJrdNb+HNAFCldipUH460aQrXtNizdIKLgjYv4jqX5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782616992; c=relaxed/simple;
	bh=/57juzOGOzrSaHjWyULUtIB764SB2yyzk16YPNS/xYw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dlDDn8LJAaJwG2/TiaGtyECdGwWPfxkeRvRaDvguQBBvEotVS0UgWyADh2F6+Oi2/AwuLUZUHZpa78ApUj1bwsQKIIqSbbxSbnczzptKcDZ2JfVZBTuRytcuxyo/05mitBZrYOR0eLTub+y9R/At6SL6uZwxqCwolCFow3b65WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsNIvDxz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsNIvDxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782616989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFKBGsrRsnXlsbQadHOsA5ZfNzI9NyXrDQgEBb/KwdQ=;
	b=KsNIvDxzYL9H8DycUYav7AZIwuWfBhZWRW8thu5S0UZTFvWCK4QCUqYTNVgMNrWIO5e5SR
	3JT7O2UszrFJN4wkxkzf5qt1Q6lEpfI7XNoke16xafbp2oa/veYtoJk/KUYLrZRD+c9sgB
	CCAuB8rL4beaLuq9lCNqIusZPp1iUxo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-Q-4viiqGNxipuYWlasD50w-1; Sat,
 27 Jun 2026 23:23:08 -0400
X-MC-Unique: Q-4viiqGNxipuYWlasD50w-1
X-Mimecast-MFC-AGG-ID: Q-4viiqGNxipuYWlasD50w_1782616987
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31C5419560AA
	for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 03:23:07 +0000 (UTC)
Received: from [172.20.60.60] (unknown [10.30.44.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 66F96195608E;
	Sun, 28 Jun 2026 03:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, f0789fd3)
Date: Sun, 28 Jun 2026 03:23:06 -0000
To: omosnace@redhat.com, mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <91695.126062723230800199@us-mta-677.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3-tsYQa_OF0TVaHl5qy-iPh1K9V37WuqLZZx0x2VKiY_1782616987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'spi-fix-v7.2-merge-window' of git://git.kern=
el.org/pub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2632853419

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2632853419_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2632853419_aarch64_kernel_kcidb_tool_21535243_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2632853419_x86_64_kernel_kcidb_tool_21535176_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2632853419_s390x_kernel_kcidb_tool_21535179_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test



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

