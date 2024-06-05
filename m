Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3745615FA60
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 23:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630931; cv=none; b=e0PzvcdFPAf0XrkZI5KYgi0osJnD8p8RFhjAl4s6eaT3fPGjsQupijR1M/i0EF81Jl4A87lo9EfPyqAOkWzdepmuIyc2x6N1IazqAgFGwzyfo9WH5PFA51yKffoUz/Ec1GhsANz34LBMPtcU+EisreK+7lzobRbYkghZCfmWuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630931; c=relaxed/simple;
	bh=W8aEHVI1A2sq7/54sE8vNJKIEgmh7nFKzfJjHVWIhOE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=t30Br4IGVAgrOUDNCT/fK0rLceotEPtfr/C/GvNH9NGOSHtEkycCKUD8x4PWZWRtJu4ksK6u0t7dbC3WX+0NwMhu0SBfRemsdHQmPNrF4BqnkgPzZ8T/A/S0GEZWZtffhAU60byj7c4GOlLft0XbYbP9RHqvHVr0NwFDbtGMvy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kw3s4nyR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kw3s4nyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717630928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MI6Ime4yphYbA15iwT6MNqPdpg1XXXCmDt78z7ibsRw=;
	b=Kw3s4nyR/6JbMEzTq7h4kinrJnKmCBAarOEuVzkDNj29/sJXE93IwpWeY8ZjtkouqzTPjO
	JDxv0IXV2QLqgyD5FR/B/9CHAN3CrB1iAxjbKwHWVX2nVlHvZ76TPsoP4mrzToUFsXWs7f
	2VVi0tb/BpFi6a708qAo7UqMMK+P0ZI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-Irdtj4KEM5iGHinRvBrBRA-1; Wed,
 05 Jun 2024 19:42:06 -0400
X-MC-Unique: Irdtj4KEM5iGHinRvBrBRA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBC6F195423A
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 23:42:05 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5797619560A2;
	Wed,  5 Jun 2024 23:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, 2df0193e)
Date: Wed, 05 Jun 2024 23:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <02213.124060519420601015@us-mta-401.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.10-rc3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1320246655

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1320246655-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1320246655-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1320246655-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1320246655-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1320246655-x86_64-kernel-debug


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

