Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF718AE2
	for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737498130; cv=none; b=FzY4nbaiZ9DPCgHyTzd0CqQuUhpitnnHei1SZZ3MTMeObrSYMu+A1kBzrN2ptOjfmK6zS0YEGiuesmbPY8iIK5ndigqBmvhAMa+iZ2PdAfgFA8u+5BJxE0+Nj+w9HAucm+KJgehs6ptOsFkgkFcxh/GjxXQFxVYxGc4U5mTaNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737498130; c=relaxed/simple;
	bh=rH5mntzjCP/mwQD5dzeaTj8axuQqwE/fy+mtJCmSSzI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NNwSTypFcCCKaLbyoX47lRJvBbMp/FUjoq3QHOJHlPBviwXKw6WofU5hq23pGJGn2Fijk8+ipDghlCD5aqdHhYQjC81YqeMBPvvcMeXtGsGNjDSRLTd+sSXlwFjAlUZ37DRoB3HJRVg+Ww47S+0MfPnNjc5AG+qZRnbdNwFbRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pp3bvCtZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pp3bvCtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737498127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i6yzJ94sjMwc4r9xPO2BKDXwMCRZZ4JdZifLqa06F5U=;
	b=Pp3bvCtZQ1iIaGGOeP7JnyIAT1IplAPd+b/cI3WvCNW8pbZqygTbYJgbpJGa/FcDIJ9Xko
	NU8/Vo92ty7f3To88ZRX7WgQ3SzdEu6JGHW6cDfvplP3MoQa8ZIyf7YZZE8+LjhiPyIAXI
	WNiFuNWZvtLX3BvDPsaFtJvUAey+Nzk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-FoFeviu1PDqPaqsxPFeWHA-1; Tue,
 21 Jan 2025 17:22:06 -0500
X-MC-Unique: FoFeviu1PDqPaqsxPFeWHA-1
X-Mimecast-MFC-AGG-ID: FoFeviu1PDqPaqsxPFeWHA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96B8319560B7
	for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:22:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2FEA819560A7;
	Tue, 21 Jan 2025 22:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 62de6e16)
Date: Tue, 21 Jan 2025 22:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <76091.125012117220600779@us-mta-421.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RCxTF0eUFYdR_5hd04oygfTaIjt8-mOpumISScDUgt8_1737498125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched-core-2025-01-21' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1634888959

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1634888959-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1634888959-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1634888959-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

