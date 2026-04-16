Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F943A544F
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335533; cv=none; b=e9B+B2Ak2mDbSkuMk6BlXfdog8d/VtUHx0k6nJ0Q+aax9LODNkqidXqcMZdaRXJ6TDXog0rbiOLyoTZeSzWTifz3UDpDXQ+nKH3/PeL9Ak0Lo+ksmkok4uBkAA7xqkIyE9hIEaq5+udDJnenRIJhJJQcW4RJdHspaNHP7o8zMg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335533; c=relaxed/simple;
	bh=rSjrwfvsVQ9P/xhBHOt9Dqmm5pbAc8p9JG0lsaHCKwI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=h+9XUyh3pPmEfml9W/fHxBS0rOEEBFymMYHSHoF/uKHYvFfGTE1WG8nIs5ddH4JUAmcdYd0415sDeGxndRpwEL4TxY29USHFZJ7xSMjjTcWXJcT2QyHZfpkkwEBW/4MB21uWmnwQSfT5/RuOoJ4iMzKZ5scuYv3Xi1I1x9UJURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRYb2SLI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRYb2SLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776335528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YtnxJXFYnDF0a+12twQ/1xW2mnRlVOqjAusdoZxkJtI=;
	b=VRYb2SLIa+SKEha0Iu/kIfQG2u/Cc9SISQ6OuO6w8a5t84wXzu2hOl0iAP4bIBYtLm10NQ
	05NQYXSon1lVWS0Rqkal7itki94jhaylf2/GteJoSOemZaX6bFgaN89xpvdTkHfgaYEm7H
	BW5cc5kR3MTdHme1o02NPmhemx1ly/Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-ZiM6mvseNs6Q-yjpDAanIw-1; Thu,
 16 Apr 2026 06:32:06 -0400
X-MC-Unique: ZiM6mvseNs6Q-yjpDAanIw-1
X-Mimecast-MFC-AGG-ID: ZiM6mvseNs6Q-yjpDAanIw_1776335526
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1D31195608B
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 10:32:05 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D59219560B6;
	Thu, 16 Apr 2026 10:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 88 of 97): Test report for master
 (7.0.0-0, upstream-mainline, aec2f682)
Date: Thu, 16 Apr 2026 10:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <36666.126041606320601104@us-mta-635.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDpgwBKHke6mOY7r2hPf7uzCzUj-Z2tfSVCzlcnjf2s_1776335526
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
    Commit message: Merge tag 'v7.1-p1' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2456331375

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

