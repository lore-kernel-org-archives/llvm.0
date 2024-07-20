Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1F1C14
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 01:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721438528; cv=none; b=l62QI6xqUX0BpF0MVZjzJRJET6RiJIa9pCE3g8nc1hJC1TAtUjNqoWtvQli4H5zmpZSeQ2wJJksNi2ElQCtD21D+7zv2xdyJIFbki3SQ3SUJwj/wJWIreN27Le1Ik59w+E5sZPpWPgmhrGeAzySzaMix32CggI1WQNEnRd7CVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721438528; c=relaxed/simple;
	bh=ztqoEAh4E6MxUUW0jQ9+DYwYcE53iNRrtJTrdes4fDY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QUUQDZ5wT4N6IrxGHwyp+PMV6yasj98rsIb1KR7qI4PGGjm9N7eSv+LL+JBRleCby53D2cz/rmL+UnB5yCKQNohAO+RO70gQl3L0VH7jltd9Hh80g1mJqODV0PZuovGRrTnq7SdZZzCrgFqd6C+lsHcaC0wRk9uarh1PiaCEyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJOgko5m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJOgko5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721438525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Zk3VjDWr4OYL3TpaMxMVFU/21A+DTEYce8jpf3z2Rc=;
	b=bJOgko5mxE9YvDMhxiOWlND81FE24Bole9+T3NqqVYe9oM4LzBeoq8z/vlpVKxas0sWoKs
	exsWNSya0EN+21xhwBLOXK1XeK/bvX981fx3bJAKzh84x2h/o8IK+WcIQWNlZQNUfXCkzV
	G8mCbrXvskidrWvOS5tbwNILT42u7ng=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-3EeojHJdNbCA_Zmg3lssIw-1; Fri,
 19 Jul 2024 21:22:03 -0400
X-MC-Unique: 3EeojHJdNbCA_Zmg3lssIw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0588819560AB
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 01:22:03 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F5281955F40;
	Sat, 20 Jul 2024 01:22:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 8e5c0abf)
Date: Sat, 20 Jul 2024 01:22:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <09632.124071921220300421@us-mta-79.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org=
/pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1381064781

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381064781-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381064781-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1381064781-x86_64-kernel-debug


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

