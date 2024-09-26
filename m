Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87E136357
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360008; cv=none; b=kri/8Ni8TU6VI0J9VJqwENCCKyOY/mGpA8fXKrJqzhXxA5N3xYDUWgRz50kKZ/Yd7J7ahRJMbjUB65myoogJNSsV6wv5YIgm0Nem5lQKMSSqR8ySgFoDrJ9jr1TZmFc/32UKwaTWfj05m3W+A0g8yD3ta0chQtnws0YoMY9tBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360008; c=relaxed/simple;
	bh=FE7oczxwY/1e1hy6Kg7B1Bw7F4rpwjOrqg7YrFdi9RE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bLasMif3bRpy5lZemhqbvTYr2h+5c30Zzya1fQTHRSM41jlqaV09Fpt2+P9GNoY1iehIVdcAUP1puJhJai4WEYMhrAe6n9fbYavCqDAL5t7hACGKN1MzUzm1T6wvwxnRJPOEkv3C8ZeP2BWJt0wMxVjnFajZD2Aj1GLfUNIL5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+Zwbk1b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+Zwbk1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p7VMMLnQh9F76mj/f3y0MzPWvTujKW8PKi3kAOcbezc=;
	b=J+Zwbk1bNjgw4p0o3lDdfh7tEL0x6EBr8k/gBSLoC8y7mIXb1QGGtn8g+TP1hE1etQgCv8
	EFQ4Br9sCDqe+RbSzmOWj7uXWxjCQ8hHZl8aUSvcrYfKJRjIn5A9RbsvkK5iIZsgD0Mqe3
	LomULhTYlyo4gtI/1BxPJzAD7AWekFs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-eX31E0f2NUqejjhb2ld62w-1; Thu,
 26 Sep 2024 10:13:24 -0400
X-MC-Unique: eX31E0f2NUqejjhb2ld62w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9216C18F3951
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:23 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C15E3003DF2;
	Thu, 26 Sep 2024 14:13:23 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 684a64bf)
Date: Thu, 26 Sep 2024 14:13:23 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <02999.124092610132402526@us-mta-636.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfs-for-6.12-1' of git://git.linux-nfs.org/p=
rojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1467804733

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467804733-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467804733-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1467804733-x86_64-kernel-debug


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

