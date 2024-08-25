Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1151C3D
	for <llvm@lists.linux.dev>; Sun, 25 Aug 2024 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724552533; cv=none; b=hZa/q/lXyNuqy7aG/KYHb2YxxU9TXC9xKe54//IUmAcP9he7r6KnFjNVuWE5pir9/kw1q9pKS4mc/DNaK7r4qkuf1S6ADjqyUySccBBRbEd+FuRuQkcVIfuLV2nmp5A5180qoW+E4dPHA0rejwraG7lHCXFdRBqP+4/c0AElLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724552533; c=relaxed/simple;
	bh=R8YaGuv8aD7L1i+fdhENuDE3x7WisViGJ4r8Xzc0U8A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DZJ8KlNgGQLFcVY1R91XrvpaeaL81jh+5Sdzm4rj7LNMvWMeQ5IewIj1zr8mSuQ57uf+dpXk8b/CddnpcCJNL+vn5wv2nVhgSrEhiGpvncaK4ifvd9R2mjMGyohUtGQtwXq87eMdb/68lR5756wmSlq9yAZD7tiLsbfwSd6BsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+15BM8y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+15BM8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724552530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/zMNowy3GOGVqSSf/q++z396mXXuhaeLEqrzy6bi7z8=;
	b=M+15BM8yw/rnuM4j1GpiqT6a30UCPjpIqWrG0B4859q5hqn+fTuWCLOHktL/VIgubu31mQ
	NMFVLQgdsphj4nzaae5Dh4J/r4/DviRBFP7N8icfuG5rO3dOOXjwJO1ODpVZ2YVXDND5WL
	LGOj9laWgwFK6THM7bK04E22yVSWc3U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-AAQJStXiM6q4TTMC2jqecg-1; Sat,
 24 Aug 2024 22:22:07 -0400
X-MC-Unique: AAQJStXiM6q4TTMC2jqecg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8CD2E1956080
	for <llvm@lists.linux.dev>; Sun, 25 Aug 2024 02:22:06 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD68B19560AA;
	Sun, 25 Aug 2024 02:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 780bdc1b)
Date: Sun, 25 Aug 2024 02:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <71825.124082422220700131@us-mta-213.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.11-rc5-server-fixes' of git://git.samba.or=
g/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1426045071

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1426045071-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1426045071-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1426045071-x86_64-kernel-debug


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

